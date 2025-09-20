#!/bin/sh

change_theme() {
    # waybar
    sed -i "s/\".*\/colors.css\"/\"$1\/colors.css\"/" $HOME/.config/waybar/style.css
    sed -i "s/\".*\/style.css\"/\"$1\/style.css\"/"   $HOME/.config/waybar/style.css
    sed -i "s/waybar\/.*\/layout.jsonc/waybar\/$1\/layout.jsonc/" $HOME/.config/waybar/config.jsonc

    # hyprland
    sed -i "s/themes\/.*\.conf/themes\/$1.conf/" $HOME/.config/hypr/hyprland.conf

    # rofi
    sed -i "s/^@import \"themes\/colors\/.*\.rasi\"/@import \"themes\/colors\/$1.rasi\"/" $HOME/.config/rofi/themes/colors.rasi

    # bspwm
    sed -i "s/^source \$HOME\/\.config\/bspwm\/themes\/.*/source \$HOME\/.config\/bspwm\/themes\/$1/" $HOME/.config/bspwm/bspwmrc

    # polybar
    sed -i "s/include-file = .*\/config.ini/include-file = \$HOME\/\.config\/polybar\/themes\/$1\/config.ini/" $HOME/.config/polybar/config.ini

}

theme=$(echo -e "Catppuccin\nCatppuccin-Latte\nNord" | rofi -dmenu -i -p "")

if [ -n "$theme" ]; then
    change_theme ${theme,,}
    [ "$DESKTOP_SESSION" = "bspwm" ] && bspc wm --restart || $HOME/.config/hypr/scripts/restore-waybar.sh
    notify-send "Theme" "Change theme to $theme"
fi

