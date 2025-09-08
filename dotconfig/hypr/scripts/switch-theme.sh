#!/bin/sh

change_theme() {
    # waybar
    sed -i "s/\".*\/colors.css\"/\"$1\/colors.css\"/" $HOME/.config/waybar/style.css
    sed -i "s/\".*\/style.css\"/\"$1\/style.css\"/"   $HOME/.config/waybar/style.css
    sed -i "s/waybar\/.*\/layout.jsonc/waybar\/$1\/layout.jsonc/" $HOME/.config/waybar/config.jsonc
    $HOME/.config/hypr/scripts/restore-waybar.sh

    # hyprland
    sed -i "s/themes\/.*\.conf/themes\/$1.conf/" $HOME/.config/hypr/hyprland.conf

    # rofi
    sed -i "s/^@theme \"themes\/default\/.*\.rasi\"/@theme \"themes\/default\/$1.rasi\"/" $HOME/.config/rofi/config.rasi
}

theme=$(echo -e "Catppuccin\nNord" | rofi -dmenu -i -p "")
if [ -n "$theme" ]; then
    change_theme ${theme,,}
    notify-send "Theme" "Change theme to $theme"
fi

