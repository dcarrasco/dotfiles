#!/bin/sh

if [ "$(nmcli radio wifi)" == "enabled" ]; then
    nmcli radio wifi off
    notify-send "WIFI" "Turn wifi off"
else
    nmcli radio wifi on
    notify-send "WIFI" "Turn wifi on"
fi
