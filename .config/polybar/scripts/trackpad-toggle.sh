#!/bin/sh

TOUCHPAD_OFF=$(synclient -l | grep -q 'TouchpadOff.*1'; echo $?)
TAPBUTTON=$(synclient -l | grep -q 'TapButton1.*1'; echo $?)

if [ $TOUCHPAD_OFF -eq 0 ]; then
    # echo "caso1: touchpad apagado --> se prende, tapbutton on"
    synclient TouchpadOff=$TOUCHPAD_OFF
    synclient TapButton1=1
else
    if [ $TAPBUTTON -eq 0 ]; then
        # echo "caso2: touchpad prendido / tapbutton on --> tapbuttonse off"
        synclient TapButton1=$TAPBUTTON
    else
        # echo "caso3: touchpad prendido --> se apaga"
        synclient TouchpadOff=$TOUCHPAD_OFF
    fi
fi

# ./trackpad-status.sh
# ./trackpad.sh

# synclient TouchpadOff=$(synclient -l | grep -q 'TouchpadOff.*1'; echo $?)

