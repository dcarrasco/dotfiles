#!/bin/sh

case $DESKTOP_SESSION in
    bspwm)
        if [ -n "$(pidof redshift)" ]; then
            killall redshift
            notify-send "Nightlight" "Turned off"
        else
            redshift -l -33:-70 &
            notify-send "Nightlight" "Turned on"
        fi
        ;;
    *)
        if [ -n "$(pidof wlsunset)" ]; then
            killall wlsunset
            notify-send "Nightlight" "Turned off"
        else
            wlsunset -l -33 -L -70 &
            notify-send "Nightlight" "Turned on"
        fi
        ;;
esac
