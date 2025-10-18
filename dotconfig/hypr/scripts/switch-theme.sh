#!/bin/sh

change_theme() {
    # waybar
    sed -i "s/\".*\/style.css\"/\"themes\/$1\/style.css\"/"   $HOME/.config/waybar/style.css
    sed -i "s/\".*\/layout.jsonc\"/\"\$HOME\/\.config\/waybar\/themes\/$1\/layout.jsonc\"/"   $HOME/.config/waybar/config.jsonc
}

theme=$(echo -e "Square\nCircle\nUnderscore\nMac" | rofi -dmenu -i -p "")

if [ -n "$theme" ]; then
    change_theme ${theme,,}
    [ "$DESKTOP_SESSION" = "bspwm" ] && bspc wm --restart || $HOME/.config/hypr/scripts/restore-waybar.sh
    notify-send "Theme" "Change theme to $theme"
fi

