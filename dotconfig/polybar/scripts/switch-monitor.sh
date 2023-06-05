#!/bin/bash

OPTION_MONITOR_INT="Solo monitor interno"
OPTION_MONITOR_EXT="Solo monitor externo"
OPTION_MONITOR_BOTH="Ambos monitores"

function opciones_un_monitor () {
    echo "$OPTION_MONITOR_INT\n"
}

function opciones_dos_monitores () {
    echo "$OPTION_MONITOR_INT\n$OPTION_MONITOR_EXT\n$OPTION_MONITOR_BOTH\n"
}

function external_monitor_name () {
    xrandr -q | grep " connected" | grep -v eDP | cut -d " " -f 1
}

function monitors_connected () {
    xrandr -q | grep " connected" | wc -l
}

if [ $(monitors_connected) \> 1 ]; then
    OPCIONES=$(opciones_dos_monitores)
    EXTERNAL_MONITOR=$(external_monitor_name)
else
    OPCIONES=$(opciones_un_monitor)
fi

MODO=$(echo -e $OPCIONES | rofi -dmenu -p "Monitor")
echo $MODO

case $MODO in
    $OPTION_MONITOR_INT)
        xrandr --output eDP --primary --auto --rotate normal --output $EXTERNAL_MONITOR --off
    ;;
    $OPTION_MONITOR_EXT)
        xrandr --output eDP --off --output $EXTERNAL_MONITOR --primary --auto --rotate normal
    ;;
    $OPTION_MONITOR_BOTH)
        xrandr --output eDP --primary --auto --rotate normal --output $EXTERNAL_MONITOR --auto --rotate normal --right-of eDP
    ;;
esac

bspc wm -r

