#!/bin/bash

ROFI_CMD="rofi -dmenu -i -p "Buscar""
filename=$(fdfind . "/home/daniel/" -t f | sed 's/\/home\/daniel\///g' | $ROFI_CMD)

if [[ ! -z "$filename" ]]; then
    open "$filename"
fi

