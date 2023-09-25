#!/bin/sh

OPTION_TRACKPAD_TAP="   Trackpad tap"
OPTION_TRACKPAD_CLICK="   Trackpad click"
OPTION_NO_TRACKPAD="   Trackpad deshabilitado"

OPTIONS="$OPTION_TRACKPAD_TAP\n$OPTION_TRACKPAD_CLICK\n$OPTION_NO_TRACKPAD\n"

ROFI_CMD="rofi -dmenu -i -p Trackpad"
selected=$(printf "$OPTIONS" | $ROFI_CMD)

case $selected in
    $OPTION_TRACKPAD_TAP)
        synclient TouchpadOff=0
        synclient TapButton1=1
    ;;
    $OPTION_TRACKPAD_CLICK)
        synclient TouchpadOff=0
        synclient TapButton1=0
    ;;
    $OPTION_NO_TRACKPAD)
        synclient TouchpadOff=1
    ;;
esac


# TOUCHPAD_OFF=$(synclient -l | grep -q 'TouchpadOff.*1'; echo $?)
# TAPBUTTON=$(synclient -l | grep -q 'TapButton1.*1'; echo $?)

# if [ $TOUCHPAD_OFF -eq 0 ]; then
    # echo "caso1: touchpad apagado --> se prende, tapbutton on"
    # synclient TouchpadOff=$TOUCHPAD_OFF
    # synclient TapButton1=1
# else
    # if [ $TAPBUTTON -eq 0 ]; then
        # echo "caso2: touchpad prendido / tapbutton on --> tapbuttonse off"
        # synclient TapButton1=$TAPBUTTON
    # else
        # echo "caso3: touchpad prendido --> se apaga"
        # synclient TouchpadOff=$TOUCHPAD_OFF
    # fi
# fi




# ./trackpad-status.sh
# ./trackpad.sh

# synclient TouchpadOff=$(synclient -l | grep -q 'TouchpadOff.*1'; echo $?)

