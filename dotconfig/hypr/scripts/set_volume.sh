#! /bin/sh

step=""
icon=""
if [ "$1" = "up" ]; then
    step="5%+"
    icon="audio-volume-high"
elif [ "$1" = "down" ]; then
    step="5%-"
    icon="audio-volume-low"
fi

if [ -n "$step" ]; then
    amixer set Master $step
    volume=$(amixer get Master | grep "Front Left:" | cut -d [ -f 2 | cut -d % -f 1)
    notify-send -c OSD -h int:value:$volume -i $icon "Volumen"
fi
