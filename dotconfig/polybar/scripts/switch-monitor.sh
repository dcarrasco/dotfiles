#!/bin/sh

OPTION_MONITOR_INT="󰌢  Solo monitor interno"
OPTION_MONITOR_EXT="󰍹  Solo monitor externo"
OPTION_MONITOR_BOTH="󰍺  Ambos monitores"
OPTION_SET_RESOLUTION="󱋆  Cambiar resolucion"

opciones_un_monitor() {
    echo "$OPTION_MONITOR_INT\n\n$OPTION_SET_RESOLUTION\n"
}

opciones_dos_monitores() {
    echo "$OPTION_MONITOR_INT\n$OPTION_MONITOR_EXT\n$OPTION_MONITOR_BOTH\n\n$OPTION_SET_RESOLUTION\n"
}

primary_monitor_name() {
    # xrandr -q | grep "primary" | cut -d " " -f 1
    echo "eDP"
}

external_monitor_name() {
    xrandr -q | grep " connected" | grep -v $(primary_monitor_name) | cut -d " " -f 1
}

monitors_connected() {
    xrandr -q | grep " connected" | wc -l
}

is_wayland() {
    xrandr -q | grep " connected" | grep "WAYLAND"| wc -l
}

if [ $(is_wayland) -gt 0 ]; then
    IS_WAYLAND="YES"
else
    IS_WAYLAND="NO"
fi

if [ $(monitors_connected) -gt 1 ]; then
    OPCIONES=$(opciones_dos_monitores)
    EXTERNAL_MONITOR=$(external_monitor_name)
else
    OPCIONES=$(opciones_un_monitor)
fi

MODO=$(printf "$OPCIONES" | rofi -dmenu -p "Monitor")

case $MODO in
    $OPTION_MONITOR_INT)
        if [ "$IS_WAYLAND" == "YES" ]; then
            echo ""
        else
            xrandr --output eDP --primary --auto --rotate normal --output $EXTERNAL_MONITOR --off
            bspc wm -r
        fi
    ;;
    $OPTION_MONITOR_EXT)
        xrandr --output eDP --off --output $EXTERNAL_MONITOR --primary --auto --rotate normal
        bspc wm -r
    ;;
    $OPTION_MONITOR_BOTH)
        xrandr --output eDP --primary --auto --rotate normal --output $EXTERNAL_MONITOR --auto --rotate normal --right-of eDP
        bspc wm -r
    ;;
    $OPTION_SET_RESOLUTION)
        arandr
        bspc wm -r
    ;;
esac


