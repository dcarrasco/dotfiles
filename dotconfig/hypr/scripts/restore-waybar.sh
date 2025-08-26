#!/bin/sh
killall waybar
GTK_THEME=Nordic setsid waybar &
notify-send "Waybar" "Restore Waybar"
