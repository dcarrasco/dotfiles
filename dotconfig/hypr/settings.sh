#!/bin/sh

bluetooth_status=$(bluetoothctl show | grep -q "Powered: no")
wifi_status=$(nmcli device wifi | grep '*' | wc -l)

# if $bluetooth_status; then
if bluetoothctl show | grep -q "Powered: no"; then
    bluetooth_option="Encender bluetooth"
else
    bluetooth_option="Apagar bluetooth"
fi

if [ $wifi_status -eq 1 ]; then
    wifi_option="Apagar WIFI"
else
    wifi_option="Encender WIFI"
fi

keyboard_option="Toggle keyboard lang"
swapcontrol_option="Swap keyboard control-caps"

options="$bluetooth_option
$keyboard_option
$swapcontrol_option
$wifi_option"

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
    $wifi_option)
        wifi_state=$(nmcli radio wifi)
        if [ "$wifi_state" == "enabled" ]; then
            nmcli radio wifi off
        else
            nmcli radio wifi on
        fi
    ;;
esac


# echo "$options" | rofi -dmenu -i -p "Settings"
