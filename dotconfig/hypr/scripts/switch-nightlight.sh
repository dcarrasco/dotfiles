#!/bin/sh

if [ -n "$(pidof wlsunset)" ]; then
    killall wlsunset
    notify-send "Nightlight" "Turned off"
else
    wlsunset -l -33 -L -70 &
    notify-send "Nightlight" "Turned on"
fi
