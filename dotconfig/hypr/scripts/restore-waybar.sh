#!/bin/sh
PID=$(pidof waybar)
if [ -n "$PID" ]; then
    notify-send "Waybar" "Reload Waybar"
    pkill -SIGUSR2 waybar
else
    # GTK_THEME=Nordic setsid waybar &
    setsid waybar &
    notify-send "Waybar" "Restore Waybar"
fi
