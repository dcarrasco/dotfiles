#!/bin/sh

rofi_theme=$HOME/.config/rofi/themes/catppuccin-mocha.rasi

keybinds=$(
    cat $HOME/.config/sxhkd/sxhkdrc |
    awk 'BEGIN{ OFS=";" } { if (substr($0,0,1) == "#") {comment=$0; has_comment=1;} else {if (has_comment == 1) {print $0, comment; comment=""; has_comment=false;} } }' |
    sed 's/;#/;/' |
    sed '/^; #*/d' |
    sed 's/ +/+/g' |
    sed 's/\+ /+/g' |
    sed 's/; /;/g' |
    sed 's/\+Return/+[ENTER]/' |
    sed 's/\+alt/+[ALT]/' |
    sed 's/\+space/+[SPACE]/' |
    sed 's/\+control/+[CTRL]/' |
    sed 's/\+shift/+[SHIFT]/' |
    sed 's/\+Tab/+[TAB]/' |
    sed 's/\+Tab/+[TAB]/' |
    sed 's/^super/ /' |
    sed 's/^alt/[ALT]/' |
    awk -F ";" 'function rep(n,c){s=""; for(i=0;i<n;i++) s=s c; return s;} {print $1 rep(28-length($1), " ") $2}'
)

echo "$keybinds" | rofi -dmenu -i -p "Keybinds" -theme $rofi_theme
