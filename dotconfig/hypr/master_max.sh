#!/bin/sh

chk_cmd=$(hyprctl getoptions master:no_gaps_when_only)

option=$(echo "$chk_cmd" | grep 'int' | awk '{print $2}')

if [ $option -eq 1 ]; then
    hyprctl keyword master:no_gaps_when_only 0
else
    hyprctl keyword master:no_gaps_when_only 1
fi


