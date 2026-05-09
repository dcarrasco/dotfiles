#!/bin/sh

if [ "$(nmcli radio wifi)" == "enabled" ]; then
    nmcli radio wifi off
    notify-send "WIFI" "Disable wifi"
else
    nmcli radio wifi on
    notify-send "WIFI" "Enable wifi"
fi
