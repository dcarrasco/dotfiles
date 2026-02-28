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

count_enabled_monitors() {
    case $BACKEND in
        *wayland*) hyprctl monitors all | grep "disabled: false" | wc -l ;;
        *x11*)     xrandr -q | grep " connected" | wc -l ;;
    esac
}

list_monitors() {
    case $BACKEND in
        *wayland*) hyprctl monitors all | grep ^Monitor | cut -d " " -f 2 ;;
        *x11*)     xrandr -q | grep " connected" | wc -l ;;
    esac
}

get_monitor_list() {
    case $BACKEND in
        *wayland*)
            echo "$OPT_SET_MAIN\n$OPT_SET_DUP\n$OPT_SET_EXT\n$OPT_SET_SEC\n"

            for m in $(list_monitors); do
                local icon="  "
                [ "$MON_INT" !=  "$m" ] && icon="󰍹  "
                echo "$icon $m $(get_monitor_property $m 2)" ;
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
            MON_POS=$(get_monitor_property $monitor 1 | cut -d "@" -f 2 | cut -d " " -f 3)
            MON_DESC=$(get_monitor_property $monitor 2)
            MON_SCALE=$(get_monitor_property $monitor 10)
            MON_DISABLED=$(get_monitor_property $monitor 21)
            MON_MODES=$(get_monitor_property $monitor 24)
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
    local monitor=$1
    local resolution=$2
    local position=$3
    local scale=$4

    case $BACKEND in
        *wayland*) hyprctl keyword monitor $monitor, $resolution, $position, $scale ;;
        *x11*) xrandr --output $monitor --right-of $MON_INT --auto;;
    esac
    notify-send "Pantalla" "Set pantalla $monitor on"
}

set_monitor_on_mirror() {
    local monitor=$1
    local resolution=$2
    local position=$3
    local scale=$3

    case $BACKEND in
        *wayland*) hyprctl keyword monitor $monitor, $resolution, $position, $scale, mirror, $MON_INT ;;
        *x11*) xrandr --output $monitor --right-of $MON_INT --auto;;
    esac
    notify-send "Pantalla" "Set pantalla $monitor (mirror) on"
}

set_monitor_off() {
    local monitor=$1

    case $BACKEND in
        *wayland*) hyprctl keyword monitor $monitor, disable ;;
        *x11*)     xrandr --output $monitor --off ;;
    esac
    notify-send "Pantalla" "Set pantalla $monitor off"
}

set_resolution() {
    local monitor=$1
    local resolution=$2

    case $BACKEND in
        *wayland*) set_monitor_on $1 $2 $MON_POS $MON_SCALE ;;
        *x11*)     xrandr --output $1 --mode $2 ;;
    esac
    notify-send "Pantalla" "Resolucion $2"
}

set_scale() {
    local monitor=$1
    local scale=$2

    case $BACKEND in
        *wayland*)
            [ "$monitor" = "$MON_INT" ] && [ "$scale" = "1.5" ] && scale=1.458333
            set_monitor_on $monitor $MON_RES $MON_POS $scale
            ;;
        *x11*)
            [ "$2" == "1.0" ]  && xrandr --output $monitor --scale 1.0
            [ "$2" == "1.25" ] && xrandr --output $monitor --scale 0.8
            [ "$2" == "1.5" ]  && xrandr --output $monitor --scale 0.666
            [ "$2" == "2.0" ]  && xrandr --output $monitor --scale 0.5
            ;;
    esac
    notify-send "Pantalla" "Escala $monitor"
}

get_lid_state() {
    cat /proc/acpi/button/lid/LID0/state | cut -d ":" -f 2 | xargs
}

switch_monitor_opt() {
    if [ $(count_monitors) -gt 1 ] && [ "$(get_lid_state)" = "open" ]; then
        if [ "$MON_DISABLED" = "false" ]; then
            if [ $(count_enabled_monitors) -gt 1 ]; then
                echo -e "$OPT_SET_MON_OFF"
            fi
        else
            echo -e "$OPT_SET_MON_ON"
        fi
    else
        echo ""
    fi
}

select_monitor() {
    local monitor="$(get_monitor_list)"

    [ $(count_monitors) -gt 1 ] && echo "$(menu "$monitor" "Seleccione monitor")"
}

menu_options() {
    local option_switch=""

    OPT_SWITCH_MON="$(switch_monitor_opt)"
    [ -n "$OPT_SWITCH_MON" ] && option_switch="$OPT_SWITCH_MON\n"
    echo -e "${option_switch}$OPT_SET_RESOL\n$OPT_SCALE_100\n$OPT_SCALE_125\n$OPT_SCALE_150\n$OPT_SCALE_200"
}

get_backend() {
    MON_INT="eDP"
    BACKEND="x11"
    [ $(is_wayland) -gt 0 ] && BACKEND="wayland" && MON_INT="eDP-1"
    echo "Backend: $BACKEND / Internal Monitor: $MON_INT"
}

set_monitor_props() {
    MON=$1
    get_monitor_data $MON

    OPC=$(menu "$(menu_options)" "Monitor $MON" "Monitor: $MON_DESC ($MON_RES @ $MON_POS)")
    [ -z "$OPC" ] && exit 0

    case $OPC in
        $OPT_SET_MON_OFF) set_monitor_off $MON ;;
        $OPT_SET_MON_ON) set_monitor_on $MON $MON_RES $MON_POS $MON_SCALE;;
        $OPT_SET_RESOL)
            RES=$(menu "$MON_RES_LIST" "Resolucion $MON")
            [ -n "$RES" ] && set_resolution $MON $RES
            ;;
        $OPT_SCALE_100) set_scale $MON 1.0 ;;
        $OPT_SCALE_125) set_scale $MON 1.25 ;;
        $OPT_SCALE_150) set_scale $MON 1.5 ;;
        $OPT_SCALE_200) set_scale $MON 2.0 ;;
    esac
}

set_monitor_main() {
    for m in $(list_monitors); do
        get_monitor_data $m
        [ "$MON_INT" ==  "$m" ] && set_monitor_on $m $MON_RES $MON_POS $MON_SCALE
        [ "$MON_INT" !=  "$m" ] && set_monitor_off $m
    done
}

set_monitor_sec() {
    for m in $(list_monitors); do
        [ "$MON_INT" ==  "$m" ] && set_monitor_off $m
        [ "$MON_INT" !=  "$m" ] && set_monitor_on $m $MON_RES $MON_POS $MON_SCALE
    done
}

set_monitor_dup() {
    for m in $(list_monitors); do
        get_monitor_data $m
        [ "$m" == "$MON_INT" ] && set_monitor_on $m $MON_RES $MON_POS $MON_SCALE
        [ "$m" != "$MON_INT" ] && set_monitor_on_mirror $m $MON_RES $MON_POS $MON_SCALE
    done
}

set_monitor_ext() {
    for m in $(list_monitors); do
        get_monitor_data $m
        set_monitor_on $m $MON_RES $MON_POS $MON_SCALE
    done
}

OPT_SET_MAIN="   Solo pantalla de PC"
OPT_SET_DUP="   Duplicado"
OPT_SET_EXT="  󰍹  Ampliar"
OPT_SET_SEC="󰍹   Solo segunda pantalla"
OPT_SET_MON_OFF="    Desactivar monitor"
OPT_SET_MON_ON="    Activar monitor"
OPT_SET_RESOL="󰹑    Cambiar resolucion"
OPT_SCALE_100="    Escalar al 100"
OPT_SCALE_125="    Escalar al 125"
OPT_SCALE_150="    Escalar al 150"
OPT_SCALE_200="    Escalar al 200"


get_backend

if [ $(count_monitors) -eq 1 ]; then
    set_monitor_props $(list_monitors)
else
    MON=$(select_monitor)
    [ -z "$MON" ] && exit 0

    case $MON in
        $OPT_SET_MAIN) set_monitor_main ;;
        $OPT_SET_DUP) set_monitor_dup ;;
        $OPT_SET_EXT) set_monitor_ext ;;
        $OPT_SET_SEC) set_monitor_sec ;;
        *) set_monitor_props $(echo $MON | cut -d " " -f 2) ;;
    esac
fi

# $HOME/.config/hypr/scripts/restore-waybar.sh

