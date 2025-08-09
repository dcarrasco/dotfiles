#!/bin/sh

bluetooth_status=$(bluetoothctl show | grep -q "Powered: no")
# wifi_status=$(nmcli device wifi | grep '*' | wc -l)
wifi_status=$(nmcli | grep ^wlp2s0: | grep conectado | wc -l)
power_profile=$(tuned-adm active | cut -d " " -f 4)
on_battery=$(upower -d | grep on-battery | cut -d : -f 2 | xargs)
if [ "$on_battery" = "yes" ]; then
    balanced_profile="balanced-battery"
else
    balanced_profile="balanced"
fi

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

power_status="Power management (Fn+Q): $power_profile"

keyboard_option="Toggle keyboard lang"
swapcontrol_option="Swap keyboard control-caps"

options="$bluetooth_option
$keyboard_option
$swapcontrol_option
$wifi_option
$power_status"

selected=$(echo "$options" | rofi -dmenu -i -p "Settings")

case $selected in
    $bluetooth_option)
        ~/.config/polybar/scripts/bluetooth.sh --toggle
    ;;
    $keyboard_option)
        ~/.config/hypr/scripts/switch-keyboard-layout.sh
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
    $power_status)
        next_profile=$balanced_profile
        if [ "$power_profile" = "$balanced_profile" ]; then
            next_profile="throughput-performance"
        elif [ "$power_profile" = "throughput-performance" ]; then
            next_profile="powersave"
        fi
        tuned-adm profile $next_profile
    ;;
esac


# echo "$options" | rofi -dmenu -i -p "Settings"
