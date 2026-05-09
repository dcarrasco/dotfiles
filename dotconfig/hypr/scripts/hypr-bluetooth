#!/bin/sh

bluetooth_print() {
    if [ $(bluetooth_state) = "off" ]; then
        echo "%{F#66ffffff}"
    else
        if [ $(echo info | bluetoothctl | grep 'Device ' | wc -c) -eq 0 ]; then
            echo ""
        else
            echo ""
        fi
    fi
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        sleep 1

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >> /dev/null
        done
    else
        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
    notify-send "Bluetooth" "Set bluetooth $(bluetooth_state)"
}

bluetooth_state() {
    if bluetoothctl show | grep -q "Powered: no"; then
        echo "off"
    else
        echo "on"
    fi
}

case "$1" in
    --toggle) bluetooth_toggle ;;
    --state)  bluetooth_state ;;
    *)        bluetooth_print ;;
esac
