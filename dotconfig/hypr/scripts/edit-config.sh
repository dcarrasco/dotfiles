#!/bin/sh

#            _ _ _                         __ _
#    ___  __| (_) |_       ___ ___  _ __  / _(_) __ _
#   / _ \/ _` | | __|____ / __/ _ \| '_ \| |_| |/ _` |
#  |  __/ (_| | | ||_____| (_| (_) | | | |  _| | (_| |
#   \___|\__,_|_|\__|     \___\___/|_| |_|_| |_|\__, |
#                                               |___/

arch=(\
    "waybar/config.jsonc" \
    "waybar/style.css" \
    "hypr/hyprland.conf" \
    "hypr/envs.conf" \
    "hypr/autostart.conf" \
    "hypr/keybinds.conf" \
    "hypr/colors.conf" \
    "hypr/input.conf" \
    "hypr/looknfeel.conf" \
    "hypr/rules.conf" \
    "hypr/hyprlock.conf" \
    "hypr/scripts/edit-config.sh" \
    "hypr/scripts/sys-menu.sh" \
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

config_dir=$HOME/.config

listado=""
for file in ${arch[@]}; do
    case $(echo $file | cut -d "/" -f 1) in
        *waybar*) icon="   " ;;
        *polybar*) icon="   " ;;
        *hypr*) icon="   " ;;
        *wlogout*) icon="󰍃  " ;;
        *kitty*) icon="  " ;;
        *alacritty*) icon="  " ;;
        *bspwm*) icon="  " ;;
        *sway*) icon="  " ;;
        *rofi*) icon="  " ;;
        *wofi*) icon="  " ;;
        *sxhkd*) icon="  " ;;
        *dunst*) icon="  " ;;
        *nvim*) icon="  " ;;
        *) icon="  " ;;
    esac
    listado+="$icon$file\n"
done

file=$(echo -e "$listado" | rofi -dmenu -i -p "Edit config")

if [[ -n $file ]]; then
    icon=$(echo -e "$file" | sed "s/  */ /g" | cut -d " " -f 1)
    file=$(echo -e "$file" | sed "s/  */ /g" | cut -d " " -f 2)
    notify-send "Editing config file" "$icon   $file..."
    cd "$(dirname $config_dir/$file)"
    kitty nvim "$config_dir/$file"
fi

