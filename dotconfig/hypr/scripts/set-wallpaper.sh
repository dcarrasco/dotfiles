#! /bin/sh

wallpaper="/home/daniel/Imágenes/fondos pantalla/abstract/liquid/26-Tahoe-Dark.png"

if [ -n "$1" ]; then
    wallpaper="$1"
fi

pid=$(pidof swaybg)
if [ -n "$pid" ]; then
    killall swaybg
fi

swaybg -i "$wallpaper" -m fill &
