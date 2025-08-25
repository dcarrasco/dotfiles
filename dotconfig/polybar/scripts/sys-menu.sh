#!/bin/sh

SCRIPT_PATH=$HOME/.config/hypr/scripts

menu() {
    echo -e "$2" | rofi -dmenu -i -theme-str "configuration{show-icons:false;} entry{placeholder:\"$1...\";} window{width:20%;}" -p ""
}

webapp() {
    coproc ( flatpak run org.chromium.Chromium --new-window --app=$1 )
    exit 0
}

terminal() {
    coproc ( kitty --class hypr-sys-menu "$1" )
    exit 0
}

present_terminal() {
    coproc ( kitty --class hypr-sys-menu bash -c "$1; read -n 1 -s" )
    exit 0
}

show_capture_menu() {
    case $(menu "Capture" "  Screenshot\n  Screenrecord\n󰃉  Color") in
        *Screenshot*) show_screenshot_menu ;;
        *Screenrecord*) show_screenrecord_menu ;;
        *Color*) pkill hyprpicker || hyprpicker -a ;;
        *) show_main_menu ;;
    esac
}

show_screenshot_menu() {
    case $(menu "Screenshot" "  Region\n  Display") in
        *Region*) $SCRIPT_PATH/cmd-screenshot.sh region ;;
        *Display*) $SCRIPT_PATH/cmd-screenshot ;;
        *) show_capture_menu ;;
    esac
}

show_screenrecord_menu() {
    case $(menu "Screenrecord" "  Region\n  Display") in
        *Region*) $OMARCHY_BIN_PATH/omarchy-cmd-screenrecord ;;
        *Display*) $OMARCHY_BIN_PATH/omarchy-cmd-screenrecord output ;;
        *) show_capture_menu ;;
    esac
}

show_menu() {
    case "${1,,}" in
        *learn*) echo -e "  Keybindings\n  Omarchy\n  Hyprland\n󰍜  Waybar\n󰣇  Arch\n  Neovim\n󱆃  Bash\n󰑓  Return to Main" ;;
        *style*) echo -e "󰸌  Theme\n  Font\n  Prev Background\n  Next Background\n󰑓  Return to Main" ;;
        *update*) echo -e "  Update system\n󰉉  Install package\n󰭌  Remove package\n󰑓  Return to Main" ;;
        *toggle*) echo -e "󰂯  Bluetooth\n   Keyboard Layout\n󰪛  Keyboard ControlCaps\n   Wifi\n  Power Management\n󱄄  Screensaver\n󰔎  Nightlight\n󱫖  Idle Lock\n󰍜  Top Bar\n󰑓  Return to Main" ;;
        *system*) echo -e "  Lock\n󰤄  Suspend\n  Relaunch\n󰜉  Restart\n󰐥  Shutdown\n󰑓  Return to Main" ;;
        *setup*) echo -e "  Audio\n  Wifi\n󰂯  Bluetooth\n󰍹  Monitors\n  Keybindings\n  Input\n  Configs\n󰈷  Fingerprint\n  Fido2\n󰑓  Return to Main" ;;
        *) echo -e "󰀻  Apps\n󰥨  Search\n󰧑  Learning\n  Capture\n󰔎  Toggle\n  Style\n  Setup\n  Update\n  About\n  System" ;;
    esac
}

go_to_menu() {
    case "${1,,}" in
        *apps*) rofi -i -show drun ;;
        *search*) $SCRIPT_PATH/search-home.sh ;;

        *learn*) show_menu learn ;;
        *keybindings*) $SCRIPT_PATH/show-keybinds.sh ;;
        *omarchy*) webapp "https://manuals.omamix.org/2/the-omarchy-manual" ;;
        *hyprland*) webapp "https://wiki.hypr.land/" ;;
        *waybar*) webapp "https://github.com/Alexays/Waybar/wiki" ;;
        *arch*) webapp "https://wiki.archlinux.org/title/Main_page" ;;
        *bash*) webapp "https://devhints.io/bash" ;;
        *neovim*) webapp "https://www.lazyvim.org/keymaps" ;;

        *capture*) show_capture_menu ;;
        *toggle*) show_menu toggle ;;
        *Bluetooth*) $SCRIPT_PATH/bluetooth.sh --toggle ;;
        *Keyboard\ Layout*) $SCRIPT_PATH/switch-keyboard-layout.sh ;;
        *Keyboard\ ControlCaps*) $SCRIPT_PATH/switch-controlcaps.sh ;;
        *Wifi*) $SCRIPT_PATH/switch-wifi.sh ;;
        *Power*) $SCRIPT_PATH/switch-power-mgmt.sh ;;
        *Screensaver*) $OMARCHY_BIN_PATH/omarchy-launch-screensaver ;;
        *Nightlight*) $OMARCHY_BIN_PATH/omarchy-toggle-nightlight ;;
        *Idle*) $OMARCHY_BIN_PATH/omarchy-toggle-idle ;;
        *Bar*) pkill -SIGUSR1 waybar ;;

        *style*) show_menu style ;;
        *theme*) show_theme_menu ;;
        *font*) terminal $SCRIPT_PATH/font-menu.sh ;;
        *prev\ background*) variety -p && exit 0;;
        *next\ background*) variety -n && exit 0;;

        *setup*) show_menu setup ;;
        *Audio*) alacritty --class=Wiremix -e wiremix ;;
        # *Wifi*) alacritty --class=Impala -e impala ;;
        *Wifi*) $SCRIPT_PATH/nmcli-rofi.sh ;;
        *Bluetooth*) blueberry ;;
        # *Monitors*) edit_in_nvim ~/.config/hypr/monitors.conf ;;
        *Monitors*) $SCRIPT_PATH/switch-monitor.sh ;;
        # *Keybindings*) edit_in_nvim ~/.config/hypr/bindings.conf ;;
        # *Input*) edit_in_nvim ~/.config/hypr/input.conf ;;
        *Configs*) $SCRIPT_PATH/edit-config.sh ;;
        *Fingerprint*) terminal $OMARCHY_BIN_PATH/omarchy-setup-fingerprint ;;
        *Fido2*) terminal $OMARCHY_BIN_PATH/omarchy-setup-fido2 ;;

        *update\ system*) terminal $SCRIPT_PATH/do-update.sh ;;
        *update*) show_menu update ;;
        *install*) terminal $SCRIPT_PATH/pkg-install.sh ;;
        *remove*) terminal $SCRIPT_PATH/pkg-remove.sh ;;

        *about*) present_terminal "fastfetch";;

        *system*) show_menu system;;
        *Lock*) hyprlock ;;
        *Suspend*) systemctl suspend ;;
        *Relaunch*) uwsm stop ;;
        *Restart*) systemctl reboot ;;
        *Shutdown*) systemctl poweroff ;;
        *exit*) exit 0 ;;
        *) show_menu ;;
    esac
}

if [[ -n "$1" ]]; then
    go_to_menu "$1"
else
    show_menu
fi
