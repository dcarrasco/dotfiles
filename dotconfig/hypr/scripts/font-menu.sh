#! /bin/sh

kitty_conf=$HOME/.config/kitty/kitty.conf
alacritty_conf=$HOME/.config/alacritty/alacritty.toml

figlet -c "Terminal font"

current_font=$(grep ^font_family $kitty_conf | sed 's/^font_family  *//')
echo -e "\e[32mCurrent font: $current_font \e[0m"
font=$(fc-list :spacing=100 -f "%{family[0]}\n" | sort -u | gum choose --header="Choose terminal font:")

if [[ -n "$font" ]]; then
    sed -i "s/^font_family .*/font_family     $font/g" $kitty_conf
    sed -i "s/^family = \".*\"/family = \"$font\"/g" $alacritty_conf
fi

echo -e "\e[32mPress [ENTER]...\e[0m" && read
