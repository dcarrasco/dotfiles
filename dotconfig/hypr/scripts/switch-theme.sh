#!/bin/sh

current_theme() {
    grep import $HOME/.config/waybar/style.css | grep themes | cut -d "/" -f 2
}

change_theme() {
    # waybar
    sed -i "s/\".*\/style.css\"/\"themes\/$1\/style.css\"/"   $HOME/.config/waybar/style.css
    sed -i "s/\".*\/layout.jsonc\"/\"\$HOME\/\.config\/waybar\/themes\/$1\/layout.jsonc\"/"   $HOME/.config/waybar/config.jsonc
}

if [ -n "$1" ]; then
    theme=$1
else
    temas=(Square Circle Underscore Mac Float Tahoe KDE)

    opts=""
    for i in "${temas[@]}"; do
        if [ "${i,,}" = "$(current_theme)" ]; then
            opts="$opts<i>$i</i>\n"
        else
            opts="$opts$i\n"
        fi
    done

    theme=$(echo -e $opts | rofi -dmenu -markup-rows -i -format p -p "")
fi

if [ -n "$theme" ]; then
    change_theme ${theme,,}
    [ "$DESKTOP_SESSION" = "bspwm" ] && bspc wm --restart || $HOME/.config/hypr/scripts/restore-waybar.sh
    notify-send -u low "Theme" "Change theme to $theme"
fi

