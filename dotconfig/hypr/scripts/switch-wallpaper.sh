#! /bin/bash

wallpaper_folder="$HOME/Imágenes/fondos pantalla"
rofi_theme=$HOME/.config/rofi/themes/layout-wallpapers.rasi
wallpaper_conf=$HOME/.config/hypr/scripts/set-wallpaper.sh


wallpaper=$(find "$wallpaper_folder" -type f \
    | awk -F "" '{print $0 "\0icon\x1f" $0;}' \
    | rofi -dmenu -show-icons -p Wallpapers -config $rofi_theme)

echo "$wallpaper"
sed -i "s#^wallpaper=.*#wallpaper=\"$wallpaper\"#g" $wallpaper_conf

$HOME/.config/hypr/scripts/set-wallpaper.sh

