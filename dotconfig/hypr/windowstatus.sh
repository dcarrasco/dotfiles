#!/bin/sh

rofi=$(hyprctl activewindow | grep class | grep Rofi | wc -l)

floating_status=""
fakefullscreen_status=""
fullscreen_status=""
pinned_status=""
grouped_status=""

if [ $rofi = 0 ]; then
    if [ "$(hyprctl activewindow | grep floating | cut -d : -f 2)" = " 1" ]; then
        # floating_status=" "
        floating_status=" "
    fi

    if [ "$(hyprctl activewindow | grep fakefullscreen: | cut -d : -f 2)" = " 1" ]; then
        # fakefullscreen_status=" "
        # fakefullscreen_status="         "
        fakefullscreen_status=" "
    fi

    if [ "$(hyprctl activewindow | grep -v fake | grep fullscreen: | cut -d : -f 2)" = " 1" ]; then
        # fullscreen_status=" "
        # fullscreen_status="  "
        # fullscreen_status="  "
        fullscreen_status=" "
    fi

    if [ "$(hyprctl activewindow | grep pinned: | cut -d : -f 2)" = " 1" ]; then
        # pinned_status=" "
        # pinned_status=" 󰐃  󰤱   "
        pinned_status=" "
        floating_status=""
    fi

    if [ $(hyprctl activewindow | grep grouped: | wc -l) -gt 0 ] && [ "$(hyprctl activewindow | grep grouped: | cut -d : -f 2)" != " 0" ]; then
        # grouped_status=" "
        grouped_status=" "
    fi
fi

echo "$fakefullscreen_status$fullscreen_status$grouped_status$floating_status$pinned_status"
