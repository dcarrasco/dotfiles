#! /bin/sh

wallpaper="/home/daniel/Imágenes/BingWallpaper/Flow_by_Emanuele_Santoro.png"

if [ -n "$1" ]; then
    wallpaper="$1"
fi

pid=$(pidof swaybg)
if [ -n "$pid" ]; then
    killall swaybg
fi

swaybg -i "$wallpaper" -m fill &
