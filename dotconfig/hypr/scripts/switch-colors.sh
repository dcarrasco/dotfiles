#!/bin/sh

current_theme() {
    grep import $HOME/.config/waybar/style.css | grep colors | tr -d '"' | tr -d ';' | cut -d / -f 2 | cut -d . -f 1
}

change_theme() {
    # waybar
    sed -i "s/\"colors\/.*\.css\"/\"colors\/$1.css\"/" $HOME/.config/waybar/style.css

    # hyprland
    sed -i "s/themes\/.*\.conf/themes\/$1.conf/" $HOME/.config/hypr/hyprland.conf

    # rofi
    sed -i "s/^@import \"themes\/colors\/.*\.rasi\"/@import \"themes\/colors\/$1.rasi\"/" $HOME/.config/rofi/themes/colors.rasi

    # bspwm
    sed -i "s/^source \$HOME\/\.config\/bspwm\/themes\/.*/source \$HOME\/.config\/bspwm\/themes\/$1/" $HOME/.config/bspwm/bspwmrc

    # polybar
    sed -i "s/include-file = .*\/config.ini/include-file = \$HOME\/\.config\/polybar\/themes\/$1\/config.ini/" $HOME/.config/polybar/config.ini

}

echo "$(current_theme)"

temas=(Catppuccin Catppuccin-Latte Dracula Nord)

opts=""
for i in "${temas[@]}"; do
    if [ "${i,,}" = "$(current_theme)" ]; then
        opts="$opts<i>$i</i>\n"
    else
        opts="$opts$i\n"
    fi
done

theme=$(echo -e $opts | rofi -dmenu -markup-rows -i -format p -p "")
echo $theme

if [ -n "$theme" ]; then
    change_theme ${theme,,}
    [ "$DESKTOP_SESSION" = "bspwm" ] && bspc wm --restart || $HOME/.config/hypr/scripts/restore-waybar.sh
    notify-send "Theme" "Change theme to $theme"
fi

