#!/bin/bash

#            _ _ _                         __ _
#    ___  __| (_) |_       ___ ___  _ __  / _(_) __ _
#   / _ \/ _` | | __|____ / __/ _ \| '_ \| |_| |/ _` |
#  |  __/ (_| | | ||_____| (_| (_) | | | |  _| | (_| |
#   \___|\__,_|_|\__|     \___\___/|_| |_|_| |_|\__, |
#                                               |___/


config_dir=$HOME/.config/

arch=(\
    "waybar/config.jsonc" \
    "waybar/style.css" \
    "waybar/colors.css" \
    "hypr/hyprland.conf" \
    "hypr/envs.conf" \
    "hypr/autostart.conf" \
    "hypr/keybinds.conf" \
    "hypr/colors.conf" \
    "hypr/input.conf" \
    "hypr/looknfeel.conf" \
    "hypr/rules.conf" \
    "hypr/scripts/edit-config.sh" \
    "wlogout/layout" \
    "wlogout/style.css" \
    "kitty/kitty.conf" \
    "alacritty/alacritty.toml" \
    "bspwm/bspwmrc" \
    "bspwm/picom.conf" \
    "sxhkd/sxhkdrc" \
    "polybar/config.ini" \
    "polybar/themes/nord/config.ini" \
    "sway/config" \
    "rofi/config.rasi" \
    "wofi/config" \
    "wofi/style.css" \
    "dunst/dunstrc" \
    "nvim/lua/daniel/" \
    "../.tmux.conf" \
    "../.zshrc" \
)

listado=""

for a in ${arch[@]}; do
    listado+=$a"\n"
done

chosen=$(echo -e $listado | rofi -dmenu -p "Configuración")

if [[ -n $chosen ]]; then
    # alacritty -e nvim $chosen
    cd "$(dirname $config_dir$chosen)"
    kitty nvim "$config_dir$chosen"
fi

