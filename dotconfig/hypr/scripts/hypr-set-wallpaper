#! /bin/sh

wallpaper="/home/daniel/Imágenes/fondos pantalla/nature/photo-1488226941561-6d7a806ae42a.jpg"

if [ -n "$1" ]; then
    wallpaper="$1"
fi

pid=$(pidof swaybg)
if [ -n "$pid" ]; then
    killall swaybg
fi

swaybg -i "$wallpaper" -m fill &
