#!/bin/sh

window_status() {
    echo "$(hyprctl activewindow | grep $1 | cut -d : -f 2)" | xargs
}

rofi=$(hyprctl activewindow | grep class | grep Rofi | wc -l)

client_status=""
extra_status=""

if [ $rofi = 0 ]; then
    if [ "$(hyprctl activewindow)" != "Invalid" ]; then
        # client_status="     "
        client_status=""
    fi

    if [ "$(window_status floating)" = "1" ]; then
        # client_status=" "
        client_status=" "
    fi

    if [ "$(window_status fullscreen:)" = "1" ]; then
        # client_status=" "
        # client_status="  "
        # client_status="  "
        # client_status=" "
        client_status=" "
    fi

    if [ "$(window_status fullscreenClient)" = "2" ]; then
        # extra_status=" "
        # extra_status="           "
        # extra_status=" "
        extra_status=" "
    fi

    if [ "$(window_status pinned)" = "1" ]; then
        # pinned_status=" "
        # pinned_status=" 󰐃  󰤱   "
        client_status=" "
    fi

    if [ "$(window_status grouped)" != "0" ] && [ "$(window_status grouped)" != "" ]; then
        # extra_status=" "
        extra_status=" "
    fi
fi

echo "$client_status$extra_status"
