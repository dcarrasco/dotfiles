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
        hyprctl switchxkblayout at-translated-set-2-keyboard next
        hyprctl switchxkblayout keychron-k7 next
        hyprctl switchxkblayout keychron-keychron-k7 next
        hyprctl switchxkblayout keychron-keychron-k7-1 next
        hyprctl switchxkblayout keychron-keychron-k7-2 next
    ;;
    $swapcontrol_option)
        if hyprctl getoption input:kb_options | grep swapcaps; then
            hyprctl keyword input:kb_options ctrl:
        else
            hyprctl keyword input:kb_options ctrl:swapcaps
        fi
    ;;
    "Toggle WIFI")
        echo "wifi"
    ;;
esac


# echo "$options" | rofi -dmenu -i -p "Settings"
