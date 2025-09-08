#!/bin/sh

is_wayland() {
    wlr-randr 2> /dev/null | grep current | wc -l
}

menu() {
    if [ -z "$3" ]; then
        echo -e "$1" | rofi -dmenu -p "$2"
    else
        echo -e "$1" | rofi -a 0:2 -dmenu -p "$2" -mesg "$3"
    fi
}

count_monitors() {
    if [ "$BACKEND" = "x11" ]; then
        xrandr -q | grep " connected" | wc -l
    else
        hyprctl monitors all | grep ^Monitor | wc -l
    fi
}

get_monitor_list() {
    if [ "$BACKEND" = "x11" ]; then
        local monitors=$(xrandr -q | grep " connected" | cut -d " " -f 1)
        echo $monitors
    else
        local monitors=$(hyprctl monitors all | grep ^Monitor | cut -d " " -f 2)
        for m in $monitors; do
            echo "$m $(get_monitor_property $m 2)" ;
        done
    fi
}

get_monitor_property() {
    local monitor=$1
    local line=$2
    hyprctl monitors all | grep -A $line $monitor | tail -1 | cut -d ":" -f 2 | xargs --
}

get_monitor_data() {
    local monitor=$1

    if [ "$BACKEND" = "wayland" ]; then
        MON_RES=$(get_monitor_property $monitor 1 | cut -d "@" -f 1)
        MON_DESC=$(get_monitor_property $monitor 2)
        MON_SCALE=$(get_monitor_property $monitor 9)
        MON_DISABLED=$(get_monitor_property $monitor 16)
        MON_MODES=$(get_monitor_property $monitor 19)
        MON_RES_LIST=$(echo -e $MON_MODES | sed 's/ /\n/g' | cut -d "@" -f 1)
    fi
}

set_monitor_on() {
    case $BACKEND in
        *wayland*) hyprctl keyword monitor $1, $2, auto, $3 ;;
    esac
}

set_monitor_off() {
    case $BACKEND in
        *wayland*) hyprctl keyword monitor $1, disable ;;
    esac
}

set_resolution() {
    set_monitor_on $1 $2 $MON_SCALE
    notify-send "Pantalla" "Resolucion $2"
}

set_scale() {
    escala=$2
    [ "$MON" = "$MON_INT" ] && [ "$2" = "1.5" ] && escala=1.458333
    set_monitor_on $1 $MON_RES $escala
    notify-send "Pantalla" "Escala $escala"
}

switch_monitor() {
    if [ $(count_monitors) -gt 1 ]; then
        if [ "$MON_DISABLED" = "false" ]; then
            set_monitor_off $1
        else
            set_monitor_on $1 $MON_RES $MON_SCALE
        fi
    fi
}

switch_monitor_opt() {
    if [ $(count_monitors) -gt 1 ]; then
        if [ "$MON_DISABLED" = "false" ]; then
            echo "    Apagar monitor"
        else
            echo "    Activar monitor"
        fi
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

MON_INT="eDP-1"
BACKEND="x11"
[ $(is_wayland) -gt 0 ] && BACKEND="wayland"
echo "Backend: $BACKEND"

MON=$(select_monitor)
[ -z "$MON" ] && exit 0
get_monitor_data $MON

OPT_SWITCH_MON="$(switch_monitor_opt)"
OPT_SET_RESOL="󰹑    Cambiar resolucion"
OPT_SCALE_100="    Escalar al 100"
OPT_SCALE_125="    Escalar al 125"
OPT_SCALE_150="    Escalar al 150"
OPT_SCALE_200="    Escalar al 200"

OPCIONES=""
[ -n "$OPT_SWITCH_MON" ] && OPCIONES="$OPT_SWITCH_MON\n"
OPCIONES="$OPCIONES$OPT_SET_RESOL\n$OPT_SCALE_100\n$OPT_SCALE_125\n$OPT_SCALE_150\n$OPT_SCALE_200"

OPC=$(menu "$OPCIONES" "Monitor $MON" "Monitor: $MON_DESC ($MON_RES)")

case $OPC in
    $OPT_SWITCH_MON) switch_monitor $MON ;;
    $OPT_SET_RESOL)
        RES=$(menu "$MON_RES_LIST" "Resolucion $MON")
        if [ -n "$RES" ]; then
            set_resolution $MON $RES
        fi
        ;;
    $OPT_SCALE_100) set_scale $MON 1.0 ;;
    $OPT_SCALE_125) set_scale $MON 1.25 ;;
    $OPT_SCALE_150) set_scale $MON 1.5 ;;
    $OPT_SCALE_200) set_scale $MON 2.0 ;;
    *) exit 0;;
esac

