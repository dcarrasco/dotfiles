#!/bin/bash

arch=(\
    "$HOME/.config/polybar/config.ini" \
    "$HOME/.config/bspwm/bspwmrc" \
    "$HOME/.config/bspwm/picom.conf" \
    "$HOME/.config/hypr/hyprland.conf" \
    "$HOME/.config/sxhkd/sxhkdrc" \
    "$HOME/.config/sway/config" \
    "$HOME/.config/waybar/config" \
    "$HOME/.config/rofi/config.rasi" \
    "$HOME/.config/alacritty/alacritty.yml" \
    "$HOME/.config/kitty/kitty.conf" \
    "$HOME/.config/polybar/scripts/edit-config.sh" \
    "$HOME/.config/nvim/init.lua" \
    "$HOME/.config/nvim/lua/daniel/init.lua" \
    "$HOME/.config/nvim/lua/daniel/set.lua" \
    "$HOME/.config/nvim/lua/daniel/remap.lua" \
    "$HOME/.config/nvim/lua/daniel/packer.lua" \
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

