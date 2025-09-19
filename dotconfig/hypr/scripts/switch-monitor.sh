#!/bin/sh

is_wayland() {
    wlr-randr | grep current | wc -l
}

menu() {
    if [ -z "$3" ]; then
        echo -e "$1" | rofi -dmenu -p "$2"
    else
        echo -e "$1" | rofi -a 0:2 -dmenu -p "$2" -mesg "$3"
    fi
}

count_monitors() {
    case $BACKEND in
        *wayland*) hyprctl monitors all | grep ^Monitor | wc -l ;;
        *x11*)     xrandr -q | grep " connected" | wc -l ;;
    esac
}

get_monitor_list() {
    case $BACKEND in
        *wayland*)
            local monitors=$(hyprctl monitors all | grep ^Monitor | cut -d " " -f 2)
            for m in $monitors; do
                echo "$m $(get_monitor_property $m 2)" ;
            done
            ;;
        *x11*) xrandr -q | grep " connected" | cut -d " " -f 1 ;;
    esac
}

get_monitor_property() {
    local monitor=$1
    local line=$2
    hyprctl monitors all | grep -A $line $monitor | tail -1 | cut -d ":" -f 2 | xargs --
}

get_monitor_data() {
    local monitor=$1

    case $BACKEND in
        *wayland*)
            MON_RES=$(get_monitor_property $monitor 1 | cut -d "@" -f 1)
            MON_DESC=$(get_monitor_property $monitor 2)
            MON_SCALE=$(get_monitor_property $monitor 9)
            MON_DISABLED=$(get_monitor_property $monitor 16)
            MON_MODES=$(get_monitor_property $monitor 19)
            MON_RES_LIST=$(echo -e $MON_MODES | sed 's/ /\n/g' | cut -d "@" -f 1)
            ;;
        *x11*)
            MON_RES="$(xrandr -q | grep $monitor | sed 's/primary //' | cut -d " " -f 3 | cut -d "+" -f 1)"
            MON_DESC="$monitor"
            MON_SCALE=1.0
            MON_DISABLED="false"
            MON_MODES=""
            MON_RES_LIST="$(xrandr -q | awk -v monitor="$monitor" '{if ($1 ~ monitor) {print_now = 1} if (print_now==1 && $1 ~ /^[1-9]/) {print $1}}')"
            ;;
    esac
}

set_monitor_on() {
    case $BACKEND in
        *wayland*) hyprctl keyword monitor $1, $2, auto, $3 ;;
        *x11*) xrandr --output $1 --right-of $MON_INT --auto;;
    esac
    notify-send "Pantalla" "Set pantalla $1 on"
}

set_monitor_off() {
    case $BACKEND in
        *wayland*) hyprctl keyword monitor $1, disable ;;
        *x11*)     xrandr --output $1 --off ;;
    esac
    notify-send "Pantalla" "Set pantalla $1 off"
}

set_resolution() {
    case $BACKEND in
        *wayland*) set_monitor_on $1 $2 $MON_SCALE ;;
        *x11*)     xrandr --output $1 --mode $2 ;;
    esac
    notify-send "Pantalla" "Resolucion $2"
}

set_scale() {
    escala=$2
    case $BACKEND in
        *wayland*)
            [ "$1" = "$MON_INT" ] && [ "$2" = "1.5" ] && escala=1.458333
            set_monitor_on $1 $MON_RES $escala
            ;;
        *x11*)
            [ "$2" == "1.0" ]  && xrandr --output $1 --scale 1.0
            [ "$2" == "1.25" ] && xrandr --output $1 --scale 0.8
            [ "$2" == "1.5" ]  && xrandr --output $1 --scale 0.666
            [ "$2" == "2.0" ]  && xrandr --output $1 --scale 0.5
            ;;
    esac
    notify-send "Pantalla" "Escala $2"
}

switch_monitor_opt() {
    if [ $(count_monitors) -gt 1 ] && [ "$MON_DISABLED" = "false" ]; then
        echo -e "$OPT_SET_MON_OFF\n$OPT_SET_MON_ON\n"
    else
        echo ""
    fi
}

select_monitor() {
    local monitor
    monitor="$(get_monitor_list)"
    [ $(count_monitors) -gt 1 ] && monitor=$(menu "$monitor" "Seleccione monitor")
    echo $monitor | cut -d " " -f 1
}

menu_options() {
    local option_switch = ""
    OPT_SWITCH_MON="$(switch_monitor_opt)"
    [ -n OPT_SWITCH_MON ] && option_switch="$OPT_SWITCH_MON\n"
    echo -e "${option_switch}$OPT_SET_RESOL\n$OPT_SCALE_100\n$OPT_SCALE_125\n$OPT_SCALE_150\n$OPT_SCALE_200"
}

get_backend() {
    MON_INT="eDP"
    BACKEND="x11"
    [ $(is_wayland) -gt 0 ] && BACKEND="wayland" && MON_INT="eDP-1"
    echo "Backend: $BACKEND / Internal Monitor: $MON_INT"
}

get_backend
MON=$(select_monitor)
[ -z "$MON" ] && exit 0

get_monitor_data $MON

OPT_SET_MON_OFF="    Desactivar monitor"
OPT_SET_MON_ON="    Activar monitor"
OPT_SET_RESOL="󰹑    Cambiar resolucion"
OPT_SCALE_100="    Escalar al 100"
OPT_SCALE_125="    Escalar al 125"
OPT_SCALE_150="    Escalar al 150"
OPT_SCALE_200="    Escalar al 200"

OPC=$(menu "$(menu_options)" "Monitor $MON" "Monitor: $MON_DESC ($MON_RES)")
[ -z "$OPC" ] && exit 0

case $OPC in
    $OPT_SET_MON_OFF) set_monitor_off $MON ;;
    $OPT_SET_MON_ON) set_monitor_on $MON $MON_RES $MON_SCALE;;
    $OPT_SET_RESOL)
        RES=$(menu "$MON_RES_LIST" "Resolucion $MON")
        [ -n "$RES" ] && set_resolution $MON $RES
        ;;
    $OPT_SCALE_100) set_scale $MON 1.0 ;;
    $OPT_SCALE_125) set_scale $MON 1.25 ;;
    $OPT_SCALE_150) set_scale $MON 1.5 ;;
    $OPT_SCALE_200) set_scale $MON 2.0 ;;
esac

