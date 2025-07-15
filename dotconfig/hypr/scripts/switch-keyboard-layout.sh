#! /bin/sh

internal=at-translated-set-2-keyboard
external=keychron

keybs=$(hyprctl devices | grep "$internal\|$external" | cut -f 3)

for i in $keybs; do
    hyprctl switchxkblayout $i next
done

