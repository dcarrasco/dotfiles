#!/bin/sh

bluetooth_status=$(bluetoothctl show | grep -q "Powered: no")

# if $bluetooth_status; then
if bluetoothctl show | grep -q "Powered: no"; then
    bluetooth_option="Encender bluetooth"
else
    bluetooth_option="Apagar bluetooth"
fi

keyboard_option="Toggle keyboard lang"

swapcontrol_option="Swap keyboard control-caps"

options="$bluetooth_option
$keyboard_option
$swapcontrol_option
Toggle WIFI"

selected=$(echo "$options" | rofi -dmenu -i -p "Settings")

case $selected in
    $bluetooth_option)
        ~/.config/polybar/scripts/bluetooth.sh --toggle
    ;;
    $keyboard_option)
        curr_lang=$(setxkbmap -query | grep layout | awk '{print $2}')
        if [ "$curr_lang" == "latam,us" ]; then
            setxkbmap us,latam
        else
            setxkbmap latam,us
        fi
    ;;
    $swapcontrol_option)
        curr_swap=$(setxkbmap -query | grep options | awk '{print $2}')
        if [ "$curr_swap" == "ctrl:swapcaps" ]; then
            setxkbmap -option
        else
            setxkbmap -option ctrl:swapcaps
        fi
    ;;
    "Toggle WIFI")
        echo "wifi"
    ;;
esac


# echo "$options" | rofi -dmenu -i -p "Settings"
