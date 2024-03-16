#!/bin/sh

bluetooth_status=$(bluetoothctl show | grep -q "Powered: no")

# if $bluetooth_status; then
if bluetoothctl show | grep -q "Powered: no"; then
    bluetooth_option="Encender bluetooth"
else
    bluetooth_option="Apagar bluetooth"
fi

keyboard_option="Toggle keyboard lang"

options="$bluetooth_option
$keyboard_option
Toggle WIFI"

selected=$(echo "$options" | rofi -dmenu -i -p "Settings")

case $selected in
    $bluetooth_option)
        ~/.config/polybar/scripts/bluetooth.sh --toggle
    ;;
    "Toggle keyboard lang")
        hyprctl switchxkblayout at-translated-set-2-keyboard next
        hyprctl switchxkblayout keychron-k7 next
        hyprctl switchxkblayout keychron-keychron-k7 next
        hyprctl switchxkblayout keychron-keychron-k7-1 next
        hyprctl switchxkblayout keychron-keychron-k7-2 next
    ;;
    "Toggle WIFI")
        echo "wifi"
    ;;
esac


# echo "$options" | rofi -dmenu -i -p "Settings"
