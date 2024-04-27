#!/bin/sh

config_file=~/.config/hypr/keybinds.conf
rofi_theme=~/.config/rofi/themes/catppuccin-mocha.rasi

# keybinds=$(grep -oP '(?<=^bind = ).*' $config_file | awk -F, '{print $1 $2 " =" $3 $4}' | sed 's/exec //')
keybinds=$(grep -E '^bind' $config_file | sed -r 's/bind.? = //g' | sed 's/, /,/g' | awk -F, '{gsub(" ", "+", $1); print $1 "+" $2 "=" $3 " " $4}' | sed 's/exec //')

keybinds=$(echo "$keybinds" | sed 's/\$mainMod/ /g' | sed -E 's/(SUPER|ALT|SHIFT|CTRL|TAB|RETURN|SPACE)/[\1]/g' | sed -e 's/^+//')

max=$(echo "$keybinds" | awk -F= '{print length(length($1)), length($1)}' | sort | uniq | tail -1 | cut -d " " -f 2)

keybinds=$(echo "$keybinds" | awk -F= -v max=$max 'function rep(n,c){s=""; for(i=0;i<n;i++) s=s c; return s;} {print $1 rep(max-length($1)+1, " ") $2}')

echo "$keybinds" | rofi -dmenu -i -p "Keybinds" -theme $rofi_theme
