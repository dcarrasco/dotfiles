#!/bin/bash

ROFI_CMD="rofi -dmenu -i -matching fuzzy -sorting-method fzf -p Archivos..."
filename=$(fd . "/home/daniel/" -t f | sed 's/\/home\/daniel\///g' | $ROFI_CMD)

if [[ ! -z "$filename" ]]; then
    xdg-open "/home/daniel/$filename"
fi

