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
    $wifi_option)
        best_wifi=$(nmcli device wifi | grep Enreda | tr -d '*' | tr -s ' ' | awk '{print $7,$1;}' | sort -r | head -1 | cut -d ' ' -f 2)
        if [ $wifi_status -eq 1 ]; then
            echo "apagar"
            nmcli connection down Enreda
        else
            nmcli device wifi connect $best_wifi
        fi
    ;;
esac


# echo "$options" | rofi -dmenu -i -p "Settings"
