#!/bin/bash

filename=$(fdfind . "/home/daniel/" -t f | sed 's/\/home\/daniel\///g' | rofi -dmenu -p "Buscar")

if [[ ! -z "$filename" ]]; then
    open "$filename"
fi

