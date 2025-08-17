#!/bin/sh

step=""
icon=""
if [ "$1" = "up" ]; then
    step="5%+"
    icon="audio-volume-high"
elif [ "$1" = "down" ]; then
    step="5%-"
    icon="audio-volume-low"
elif [ "$1" = "toggle" ]; then
    amixer set Master toggle
    new_status=$(amixer get Master | grep "Front Left:" | sed -e "s/.*\[\(on\|off\)\].*/\1/")
    if [ "$new_status" = "off" ]; then
        notify-send -c OSD -i audio-volume-muted "Volumen" "Mute"
    else
        notify-send -c OSD -i audio-volume-high "Volumen" "Unmute"
    fi
fi

if [ -n "$step" ]; then
    amixer set Master $step
    volume=$(amixer get Master | grep "Front Left:" | cut -d [ -f 2 | cut -d % -f 1)
    notify-send -c OSD -h int:value:$volume -i $icon "Volumen"
fi
