#!/bin/sh

if [ $(hyprctl activewindow | wc -l) = 1 ]; then
    echo ""
else
    echo "$(hyprctl activewindow | grep 'title:' | cut -d : -f 2)"
fi
