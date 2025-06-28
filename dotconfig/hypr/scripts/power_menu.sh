#!/bin/sh

options=(\
    "Logout\0icon\x1flogout" \
    "Lock" \
    "Shutdown" \
    "Suspend" \
    "Reboot" \
)

listado=""
for a in ${options[@]}; do
    listado+=$a"\n"
done

chosen=$(echo -en "$listado" | rofi -dmenu -p "Configuración" -config ~/.config/rofi/themes/power_menu_DC.rasi)

echo $chosen

case $chosen in
esac


# echo "$options" | rofi -dmenu -i -p "Settings"
