#!/bin/sh

if [ $(synclient -l | grep -q 'TouchpadOff.*1'; echo $?) -eq 0 ]
then
  echo ""
else
  echo ""
fi
