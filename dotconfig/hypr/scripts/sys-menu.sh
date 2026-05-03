#!/bin/sh

SCRIPT_PATH=$HOME/.config/hypr/scripts
export PATH="$SCRIPT_PATH:$PATH"
terminal-pgm=kitty

menu() {
    local menu_font="Hack Nerd Font 14"
    local menu_width="390px"
    local menu_height="600px"

    local theme_str="prompt{enabled:false;} entry{placeholder:\"$1...\";} window{width:$menu_width;height:$menu_height;font:'$menu_font';}"

    echo -e "$2" | rofi -dmenu -i -markup-rows -format p -theme-str "$theme_str" -p ""

}

terminal() {
    kitty --class hypr-sys-menu --title=Fedora bash -c "$1"
}

present_terminal() {
    local cmd="$*"
    kitty --class hypr-sys-menu bash -c "show-logo.sh; $cmd; show-done.sh"
}

edit_file() {
    notify-send -u low "Editing config file" "$1"
    kitty nvim "$1"
}

back_to() {
    "$1"
}

webapp() {
    brave-browser --password-store=basic --new-window --app=$1
    # flatpak run com.brave.Browser --password-store=basic --new-window --app=$1
}

show_learn_menu() {
    case $(menu "Learn" "  Keybindings\n  Omarchy\n  Hyprland\n  Bspwm\n  Waybar\n  Polybar\n  NerdFonts\n󰣇  Arch\n  Neovim\n󱆃  Bash") in
        *Keybindings*) show-keybinds.sh ;;
        *Omarchy*)     webapp "https://manuals.omamix.org/2/the-omarchy-manual" ;;
        *Hyprland*)    webapp "https://wiki.hypr.land/" ;;
        *Bspwm*)       webapp "https://github.com/baskerville/bspwm/wiki" ;;
        *Waybar*)      webapp "https://github.com/Alexays/Waybar/wiki" ;;
        *Polybar*)     webapp "https://github.com/polybar/polybar/wiki" ;;
        *NerdFonts*)   webapp "https://www.nerdfonts.com/cheat-sheet" ;;
        *Arch*)        webapp "https://wiki.archlinux.org/title/Main_page" ;;
        *Bash*)        webapp "https://devhints.io/bash" ;;
        *Neovim*)      webapp "https://www.lazyvim.org/keymaps" ;;
        *) show_main_menu ;;
    esac
}

show_trigger_menu() {
    case "$(menu "Trigger" "  Capture\n  Toggle")" in
        *Capture*) show_capture_menu ;;
        *Toggle*)  show_toggle_menu ;;
        *) show_main_menu ;;
    esac
}

show_capture_menu() {
    case $(menu "Capture" "  Screenshot\n  Screenrecord\n󰃉  Color") in
        *Screenshot*)   show_screenshot_menu ;;
        *Screenrecord*) show_screenrecord_menu ;;
        *Color*)        pkill hyprpicker || hyprpicker -a ;;
        *) back_to show_trigger_menu ;;
    esac
}

show_screenshot_menu() {
    case $(menu "Screenshot" "󰩬   Region to clipboard\n󰩬   Region to file\n󰹑    Display to clipboard\n󰹑    Display to file") in
        *Region\ to\ clipboard*) cmd-screenshot.sh clipboard ;;
        *Region\ to\ file*)      cmd-screenshot.sh region ;;
        *Display\ to\ file*)     cmd-screenshot.sh ;;
        *) show_capture_menu ;;
    esac
}

show_screenrecord_menu() {
    case $(menu "Screenrecord" "󰩬  Region\n󰹑  Display") in
        *Region*)  $OMARCHY_BIN_PATH/omarchy-cmd-screenrecord ;;
        *Display*) $OMARCHY_BIN_PATH/omarchy-cmd-screenrecord output ;;
        *) show_capture_menu ;;
    esac
}

show_toggle_menu() {
    # wifi_status=$(nmcli radio wifi)
    # bt_status=$(if $(bluetoothctl show | grep -q "Powered: no" > /dev/null ); then echo "disabled"; else echo "enabled"; fi)
    # power_status=$(tuned-adm active | cut -d " " -f 4)
    # keyb_status=$(setxkbmap -query | grep layout | awk '{print $2}')
    case $(menu "Toggle" "  Wifi\n󰂯  Bluetooth\n  Power Management\n  Keyboard Layout\n󰪛  Keyboard ControlCaps\n󱄄  Screensaver\n󰔎  Nightlight\n󱫖  Idle Lock\n󰍜  Top Bar") in
        *Wifi*)                  switch-wifi.sh ;;
        *Bluetooth*)             bluetooth.sh --toggle ;;
        *Power\ Management*)     switch-power-mgmt.sh ;;
        *Keyboard\ Layout*)      switch-keyboard-layout.sh ;;
        *Keyboard\ ControlCaps*) switch-controlcaps.sh ;;
        *Nightlight*)            switch-nightlight.sh ;;
        *Bar*)                   pkill -SIGUSR1 waybar ;;
        *Screensaver*)       $OMARCHY_BIN_PATH/omarchy-launch-screensaver ;;
        *Idle*)              $OMARCHY_BIN_PATH/omarchy-toggle-idle ;;
        *) back_to show_trigger_menu ;;
    esac
}

show_style_menu() {
    case $(menu "Style" "  Theme\n󰸌  Colors\n  Font\n  Background\n  Hyprland") in
        *Theme*)      show_theme_menu ;;
        *Colors*)     show_colors_menu ;;
        *Font*)       show_font_menu ;;
        *Background*) switch-wallpaper.sh ;;
        *Hyprland*)   edit_file $HOME/.config/hypr/looknfeel.conf ;;
        *) show_main_menu ;;
    esac
}

show_theme_menu() {
    local temas=(Square Circle Underscore Mac Float Tahoe KDE)
    local current_theme=$(grep import $HOME/.config/waybar/style.css | grep themes | cut -d "/" -f 2)

    local opts=""
    for i in "${temas[@]}"; do
        if [ "${i,,}" = "$current_theme" ]; then
            opts="$opts<i>$i</i>\n"
        else
            opts="$opts$i\n"
        fi
    done
    local theme=$(menu "Theme" "$opts")

    if [[ -n "$theme" ]]; then
        switch-theme.sh $theme
    else
        back_to show_style_menu
    fi
}

show_colors_menu() {
    local temas=(Catppuccin Catppuccin-Latte Dracula Nord Nord-Frost)
    local current_theme=$(grep import $HOME/.config/waybar/style.css | grep colors | tr -d '"' | tr -d ';' | cut -d / -f 2 | cut -d . -f 1)

    local opts=""
    for i in "${temas[@]}"; do
        if [ "${i,,}" = "$current_theme" ]; then
            opts="$opts<i>$i</i>\n"
        else
            opts="$opts$i\n"
        fi
    done
    local theme=$(menu "Colors" "$opts")

    if [[ -n "$theme" ]]; then
        switch-colors.sh $theme
    else
        back_to show_style_menu
    fi
}

show_font_menu() {
    local kitty_conf=$HOME/.config/kitty/kitty.conf
    local current_font=$(grep ^font_family $kitty_conf | sed 's/^font_family  *//')
    local opts=$(fc-list :spacing=100 -f "%{family[0]}\n" | sort -u | gawk '{print "<span font_family=\"" $0 "\">" $0 "</span>"}')
    local font=$(menu "$current_font" "$opts")

    if [[ -n "$font" ]]; then
        switch-font.sh "$font"
    else
        back_to show_style_menu
    fi
}

show_setup_menu() {
    case $(menu "Setup" "  Configs\n  Audio\n  Wifi\n󰂯  Bluetooth\n󰍹  Monitors\n󰐪  Printers\n  Keybindings\n  Input\n󰈷  Fingerprint\n  Fido2") in
        *Configs*)     edit-config.sh ;;
        *Audio*)       terminal alsamixer ;;
        *Wifi*)        nmcli-rofi.sh ;;
        *Bluetooth*)   blueman-manager ;;
        *Monitors*)    switch-monitor.sh ;;
        *Printers*)    webapp "http://localhost:631" ;;
        *Keybindings*) [ $DESKTOP_SESSION = "bspwm" ] && edit_file $HOME/.config/sxhkd/sxhkdrc || edit_file $HOME/.config/hypr/keybinds.conf ;;
        *Input*)       edit_file $HOME/.config/hypr/input.conf ;;
        *Fingerprint*) terminal $OMARCHY_BIN_PATH/omarchy-setup-fingerprint ;;
        *Fido2*)       terminal $OMARCHY_BIN_PATH/omarchy-setup-fido2 ;;
        *) show_main_menu ;;
    esac
}

show_update_menu() {
    case $(menu "Update" "  Update\n󰉉  Install package\n󰭌  Remove package") in
        *Update*)  present_terminal do-update.sh ;;
        *Install*) terminal "pkg-install.sh; show-done.sh" ;;
        *Remove*)  terminal "pkg-remove.sh; show-done.sh" ;;
        *) show_main_menu ;;
    esac
}

show_system_menu() {
    case $(menu "System" " Lock\n󰗽 Logout\n󰐥 Power Off\n Suspend\n Restart") in
        *Lock*)       hyprlock ;;
        *Logout*)     hyprctl dispatch exit ;;
        *Power\ Off*) systemctl poweroff ;;
        *Suspend*)    systemctl suspend ;;
        *Restart*)    systemctl reboot ;;
        *) show_main_menu ;;
    esac
}

show_main_menu() {
    go_to_menu "$(menu "Start" "󰀻  Apps\n  Search\n  Learn\n  Style\n󱓞  Trigger\n  Setup\n  Update\n  About\n  System")"
}

go_to_menu() {
    case "${1,,}" in
        *apps*)    rofi -i -show drun -show-icons -theme layout-apps;;
        *search*)  search-home.sh ;;
        *learn*)   show_learn_menu ;;
        *trigger*) show_trigger_menu ;;
        *capture*) show_capture_menu ;;
        *toggle*)  show_toggle_menu ;;
        *style*)   show_style_menu ;;
        *setup*)   show_setup_menu ;;
        *do-update*)  present_terminal do-update.sh ;;
        *update*)  show_update_menu ;;
        *about*)   terminal "fastfetch && read -n 1 -s" ;;
        *system*)
            case $DESKTOP_SESSION in
                bspwm) $HOME/.config/rofi/powermenu/powermenu.sh ;;
                *)     show_system_menu ;;
                # *)     wlogout -b 5 ;;
            esac
            ;;
    esac
}

if [ -n "$1" ]; then
    go_to_menu "$1"
else
    show_main_menu
fi
