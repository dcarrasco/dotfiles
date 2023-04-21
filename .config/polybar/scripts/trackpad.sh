#!/bin/sh

STATUS=$(~/.config/polybar/scripts/trackpad-status.sh)

# echo $STATUS
if [ $STATUS -eq '10' ]; then
  echo ""
elif [ $STATUS -eq '11' ]; then
  echo ""
else
  echo ""
fi

# if [ $(synclient -l | grep -q 'TouchpadOff.*1'; echo $?) -eq 0 ]
# then
#   echo ""
# else
#   echo ""
# fi
