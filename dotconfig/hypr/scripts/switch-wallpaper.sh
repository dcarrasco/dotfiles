#! /bin/bash

wallpaper_folder="$HOME/Imágenes/fondos pantalla"
rofi_theme=$HOME/.config/rofi/themes/layout-wallpapers.rasi


wallpaper=$(find "$wallpaper_folder" -type f \
    | awk -F "" '{print $0 "\0icon\x1f" $0;}' \
    | rofi -dmenu -show-icons -p Wallpapers -config $rofi_theme)

if [[ -n "$wallpaper" ]]; then
    PID=$(pidof swaybg)
    if [ -n "$PID" ]; then
        killall swaybg
    fi
    swaybg -i "$wallpaper" -m fill &
fi
