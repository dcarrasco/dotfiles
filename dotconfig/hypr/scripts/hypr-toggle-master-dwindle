#!/bin/sh

layout=$(hyprctl -j getoption general:layout | jq -r ".str")

case $layout in
    master)  new_layout="dwindle" ;;
    dwindle) new_layout="master"  ;;
esac

hyprctl keyword general:layout $new_layout
notify-send "Hyprland Layout" "Layout set to $new_layout"
