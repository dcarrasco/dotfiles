#!/bin/sh

internal=at-translated-set-2-keyboard
external=keychron

echo "switch internal layout: $newlayout"
hyprctl switchxkblayout $internal next

newlayout=$(hyprctl devices -j | jq -r --arg k $internal '.keyboards[] | select(.name==$k).active_keymap')
echo "new internal layout: $newlayout"

keybs=$(hyprctl devices -j | jq -r '.keyboards[].name' | grep $external)
echo "keyboards: $keybs"

for i in $keybs; do
    echo "external: $i"
    currlayout="xxx"
    echo "current layout0: $currlayout"
    while [[ "$newlayout" != "$currlayout" ]]; do
        hyprctl switchxkblayout $i next
        currlayout=$(hyprctl devices -j | jq -r --arg k $i '.keyboards[] | select(.name==$k).active_keymap')
        echo "current layout: $currlayout"
    done
done

notify-send "Keyboard" "New layout: $newlayout"
