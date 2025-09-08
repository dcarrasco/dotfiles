#!/bin/sh

chk_cmd=$(bspc config single_monocle)

# option=$(echo "$chk_cmd" | grep 'int' | awk '{print $2}')

if [ "$chk_cmd" == "false" ]; then
    bspc config single_monocle true
else
    bspc config single_monocle false
fi


