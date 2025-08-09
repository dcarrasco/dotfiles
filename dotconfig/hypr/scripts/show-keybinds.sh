#!/bin/sh

rofi_theme=~/.config/rofi/themes/catppuccin-mocha.rasi

keybinds=$(
    hyprctl binds -j |
    jq '.[] | [.modmask, .key, .description] | join(",")' |
    tr -d '"' |
    sed 's/^64/ +/' |
    sed 's/^65/ +[SHIFT]+/' |
    sed 's/^68/ +[CTRL]+/' |
    sed 's/^69/ +[CTRL]+[ALT]+/' |
    sed 's/^72/ +[ALT]+/' |
    sed 's/^73/ +[SHIFT]+[ALT]+/' |
    sed 's/^0//' |
    sed 's/^8/[ALT]+/' |
    awk -F, 'function rep(n,c){s=""; for(i=0;i<n;i++) s=s c; return s;} {print $1 $2 rep(30-length($1)-length($2), " ") $3}'
)

echo "$keybinds" | rofi -dmenu -i -p "Keybinds" -theme $rofi_theme
