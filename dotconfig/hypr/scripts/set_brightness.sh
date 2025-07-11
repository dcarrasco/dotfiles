#! /bin/sh

step=""
if [ "$1" = "up" ]; then
    step="10%+"
elif [ "$1" = "down" ]; then
    step="10%-"
fi

if [ -n "$step" ]; then
    brightnessctl s $step
    brightness=$((100 * $(brightnessctl g) / $(brightnessctl max)))
    notify-send -c OSD -h int:value:$brightness -i video-display "Brillo pantalla"
fi
