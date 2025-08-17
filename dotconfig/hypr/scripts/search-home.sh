#!/bin/sh

filename=$(fd . "/home/daniel/" -t f | sed 's/\/home\/daniel\///g' | rofi -dmenu -i -matching fuzzy -sorting-method fzf -theme-str "entry{placeholder:'Buscar archivos...';}" -p "")

if [[ -n "$filename" ]]; then
    xdg-open "/home/daniel/$filename"
fi

