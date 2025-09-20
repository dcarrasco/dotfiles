#!/bin/sh

SCRIPT_PATH=$HOME/.config/hypr/scripts

menu() {
    echo -e "$2" | rofi -dmenu -i -theme-str "prompt{enabled:false;} entry{placeholder:\"$1...\";} window{width:20%;}" -p ""
}

terminal() {
    kitty --class hypr-sys-menu "$1"
}

present_terminal() {
    kitty --class hypr-sys-menu bash -c "$1; read -n 1 -s"
}

edit_vim() {
    notify-send "Editing config file" "$1"
    kitty nvim "$1"
}

webapp() {
    flatpak run org.chromium.Chromium --new-window --app=$1
}

show_learn_menu() {
    case $(menu "Learn" "  Keybindings\n  Omarchy\n  Hyprland\n  Bspwm\n  Waybar\n  Polybar\n  NerdFonts\n󰣇  Arch\n  Neovim\n󱆃  Bash") in
        *Keybindings*) $SCRIPT_PATH/show-keybinds.sh ;;
        *Omarchy*)     webapp "https://manuals.omamix.org/2/the-omarchy-manual" & ;;
        *Hyprland*)    webapp "https://wiki.hypr.land/" & ;;
        *Bspwm*)       webapp "https://github.com/baskerville/bspwm/wiki" & ;;
        *Waybar*)      webapp "https://github.com/Alexays/Waybar/wiki" & ;;
        *Polybar*)     webapp "https://github.com/polybar/polybar/wiki" & ;;
        *NerdFonts*)   webapp "https://www.nerdfonts.com/cheat-sheet" & ;;
        *Arch*)        webapp "https://wiki.archlinux.org/title/Main_page" & ;;
        *Bash*)        webapp "https://devhints.io/bash" & ;;
        *Neovim*)      webapp "https://www.lazyvim.org/keymaps" & ;;
        *) show_main_menu ;;
    esac
}

show_capture_menu() {
    case $(menu "Capture" "  Screenshot\n  Screenrecord\n󰃉  Color") in
        *Screenshot*)   show_screenshot_menu ;;
        *Screenrecord*) show_screenrecord_menu ;;
        *Color*)        pkill hyprpicker || hyprpicker -a ;;
        *) show_main_menu ;;
    esac
}

show_screenshot_menu() {
    case $(menu "Screenshot" "󰩬   Region to clipboard\n󰩬   Region to file\n󰹑    Display to clipboard\n󰹑    Display to file") in
        *Region\ to\ clipboard*) $SCRIPT_PATH/cmd-screenshot.sh clipboard ;;
        *Region\ to\ file*)      $SCRIPT_PATH/cmd-screenshot.sh region ;;
        *Display\ to\ file*)     $SCRIPT_PATH/cmd-screenshot.sh ;;
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
    case $(menu "Toggle" "   Wifi\n󰂯  Bluetooth\n  Power Management\n   Keyboard Layout\n󰪛  Keyboard ControlCaps\n󱄄  Screensaver\n󰔎  Nightlight\n󱫖  Idle Lock\n󰍜  Top Bar") in
        *Wifi*)              $SCRIPT_PATH/switch-wifi.sh ;;
        *Bluetooth*)         $SCRIPT_PATH/bluetooth.sh --toggle ;;
        *Power\ Management*) $SCRIPT_PATH/switch-power-mgmt.sh ;;
        *Keyboard\ Layout*)  $SCRIPT_PATH/switch-keyboard-layout.sh ;;
        *Keyboard\ ControlCaps*) $SCRIPT_PATH/switch-controlcaps.sh ;;
        *Screensaver*)       $OMARCHY_BIN_PATH/omarchy-launch-screensaver ;;
        *Nightlight*)        $SCRIPT_PATH/switch-nightlight.sh ;;
        *Idle*)              $OMARCHY_BIN_PATH/omarchy-toggle-idle ;;
        *Bar*)               pkill -SIGUSR1 waybar ;;
        *) show_main_menu ;;
    esac
}

show_style_menu() {
    case $(menu "Style" "󰸌  Theme\n  Font\n  Prev Background\n  Next Background") in
        *Theme*) $SCRIPT_PATH/switch-theme.sh ;;
        *Font*)  $SCRIPT_PATH/font-menu.sh ;;
        *Prev\ Background*) variety -p ;;
        *Next\ Background*) variety -n ;;
        *) show_main_menu ;;
    esac
}

show_setup_menu() {
    case $(menu "Setup" "  Configs\n  Audio\n  Wifi\n󰂯  Bluetooth\n󰍹  Monitors\n  Keybindings\n  Input\n󰈷  Fingerprint\n  Fido2") in
        *Configs*)     $SCRIPT_PATH/edit-config.sh ;;
        *Audio*)       terminal alsamixer ;;
        *Wifi*)        $SCRIPT_PATH/nmcli-rofi.sh ;;
        *Bluetooth*)   blueman-manager ;;
        *Monitors*)    $SCRIPT_PATH/switch-monitor.sh ;;
        *Keybindings*) [ $DESKTOP_SESSION = "bspwm" ] && edit_vim $HOME/.config/sxhkd/sxhkdrc || edit_vim $HOME/.config/hypr/keybinds.conf ;;
        *Input*)       edit_vim $HOME/.config/hypr/input.conf ;;
        *Fingerprint*) terminal $OMARCHY_BIN_PATH/omarchy-setup-fingerprint ;;
        *Fido2*)       terminal $OMARCHY_BIN_PATH/omarchy-setup-fido2 ;;
        *) show_main_menu ;;
    esac
}

show_update_menu() {
    case $(menu "Update" "  Update\n󰉉  Install package\n󰭌  Remove package") in
        *Update*)  terminal $SCRIPT_PATH/do-update.sh ;;
        *Install*) terminal $SCRIPT_PATH/pkg-install.sh ;;
        *Remove*)  terminal $SCRIPT_PATH/pkg-remove.sh ;;
        *) show_main_menu ;;
    esac

}

show_main_menu() {
    go_to_menu "$(menu "Start" "󰀻  Apps\n  Search\n  Learn\n  Capture\n  Toggle\n  Style\n  Setup\n  Update\n  About\n  System")"
}

go_to_menu() {
    case "${1,,}" in
        *apps*)    rofi -i -show drun -show-icons ;;
        *search*)  $SCRIPT_PATH/search-home.sh ;;
        *learn*)   show_learn_menu ;;
        *capture*) show_capture_menu ;;
        *toggle*)  show_toggle_menu ;;
        *style*)   show_style_menu ;;
        *setup*)   show_setup_menu ;;
        *update*)  show_update_menu ;;
        *about*)   present_terminal "fastfetch";;
        *system*)
            case $DESKTOP_SESSION in
                bspwm) $HOME/.config/rofi/powermenu/powermenu.sh ;;
                *)     wlogout -b 5 ;;
            esac
            ;;
    esac
}

if [ -n "$1" ]; then
    go_to_menu "$1"
else
    show_main_menu
fi
