#!/bin/sh

rofi=$(hyprctl activewindow | grep class | grep Rofi | wc -l)

floating_status=""
if [ $(hyprctl activewindow | grep floating | cut -d : -f 2) = 1 ] && [ $rofi = 0 ]; then
    floating_status=" "
fi

fullscreen_status=""
if [ $(hyprctl activewindow | grep -v fake | grep fullscreen: | cut -d : -f 2) = 1 ] && [ $rofi = 0 ]; then
    # fullscreen_status=" "
    fullscreen_status=" "
fi

pinned_status=""
if [ $(hyprctl activewindow | grep pinned: | cut -d : -f 2) = 1 ] && [ $rofi = 0 ]; then
    pinned_status=" "
fi

echo "$floating_status$fullscreen_status$pinned_status"
