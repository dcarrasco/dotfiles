#!/bin/bash

#            _ _ _                         __ _
#    ___  __| (_) |_       ___ ___  _ __  / _(_) __ _
#   / _ \/ _` | | __|____ / __/ _ \| '_ \| |_| |/ _` |
#  |  __/ (_| | | ||_____| (_| (_) | | | |  _| | (_| |
#   \___|\__,_|_|\__|     \___\___/|_| |_|_| |_|\__, |
#                                               |___/


arch=(\
    "$HOME/.config/polybar/config.ini" \
    "$HOME/.config/polybar/themes/nord/config.ini" \
    "$HOME/.config/bspwm/bspwmrc" \
    "$HOME/.config/bspwm/picom.conf" \
    "$HOME/.config/hypr/hyprland.conf" \
    "$HOME/.config/sxhkd/sxhkdrc" \
    "$HOME/.config/sway/config" \
    "$HOME/.config/waybar/config" \
    "$HOME/.config/waybar/style.css" \
    "$HOME/.config/rofi/config.rasi" \
    "$HOME/.config/alacritty/alacritty.yml" \
    "$HOME/.config/kitty/kitty.conf" \
    "$HOME/.config/polybar/scripts/edit-config.sh" \
    "$HOME/.config/dunst/dunstrc" \
    "$HOME/.config/nvim/lua/daniel/" \
    "$HOME/.tmux.conf" \
)

listado=""
for a in ${arch[@]}; do
    listado+=$a"\n"
done

chosen=$(echo -e $listado | rofi -dmenu -p "Editar")

if [[ -n $chosen ]]; then
    # alacritty -e nvim $chosen
    kitty nvim $chosen
fi

