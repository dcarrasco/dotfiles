#!/bin/sh

TOUCHPAD_OFF=$(synclient -l | grep -q 'TouchpadOff.*1'; echo $?)
TAPBUTTON=$(synclient -l | grep -q 'TapButton1.*1'; echo $?)

echo $TOUCHPAD_OFF$TAPBUTTON

