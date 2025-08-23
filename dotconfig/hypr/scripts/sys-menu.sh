#!/bin/sh

SCRIPT_PATH=$HOME/.config/hypr/scripts
webapp="flatpak run org.chromium.Chromium --new-window --app"
echo "$WEBAPP"

menu() {
    echo -e "$2" | rofi -dmenu -i -theme-str "configuration{show-icons:false;} entry{placeholder:\"$1...\";} window{width:20%;}" -p ""
}

terminal() {
    kitty --class hypr-sys-menu "$1"
}

present_terminal() {
    kitty --class hypr-sys-menu bash -c "$1; read -n 1 -s"
}

show_learn_menu() {
    case $(menu "Learn" "  Keybindings\n  Omarchy\n  Hyprland\n󰍜  Waybar\n󰣇  Arch\n  Neovim\n󱆃  Bash") in
        *Keybindings*) $SCRIPT_PATH/show-keybinds.sh ;;
        *Omarchy*) $webapp="https://manuals.omamix.org/2/the-omarchy-manual" & ;;
        *Hyprland*) $webapp="https://wiki.hypr.land/" & ;;
        *Waybar*) $webapp="https://github.com/Alexays/Waybar/wiki" & ;;
        *Arch*) $webapp="https://wiki.archlinux.org/title/Main_page" & ;;
        *Bash*) $webapp="https://devhints.io/bash" & ;;
        *Neovim*) $webapp="https://www.lazyvim.org/keymaps" & ;;
        *) show_main_menu ;;
    esac
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

show_toggle_menu() {
    case $(menu "Toggle" "󰂯  Bluetooth\n   Keyboard Layout\n󰪛  Keyboard ControlCaps\n   Wifi\n  Power Management\n󱄄  Screensaver\n󰔎  Nightlight\n󱫖  Idle Lock\n󰍜  Top Bar") in
        *Bluetooth*) $SCRIPT_PATH/bluetooth.sh --toggle ;;
        *Keyboard\ Layout*) $SCRIPT_PATH/switch-keyboard-layout.sh ;;
        *Keyboard\ ControlCaps*) $SCRIPT_PATH/switch-controlcaps.sh ;;
        *Wifi*) $SCRIPT_PATH/switch-wifi.sh ;;
        *Power*) $SCRIPT_PATH/switch-power-mgmt.sh ;;
        *Screensaver*) $OMARCHY_BIN_PATH/omarchy-launch-screensaver ;;
        *Nightlight*) $OMARCHY_BIN_PATH/omarchy-toggle-nightlight ;;
        *Idle*) $OMARCHY_BIN_PATH/omarchy-toggle-idle ;;
        *Bar*) pkill -SIGUSR1 waybar ;;
        *) show_main_menu ;;
    esac
}

show_style_menu() {
    case $(menu "Style" "󰸌  Theme\n  Font\n  Prev Background\n  Next Background") in
        *Theme*) show_theme_menu ;;
        *Font*) terminal $SCRIPT_PATH/font-menu.sh ;;
        *Prev\ Background*) variety -p ;;
        *Next\ Background*) variety -n ;;
        *) show_main_menu ;;
    esac
}

show_setup_menu() {
    local options="  Audio\n  Wifi\n󰂯  Bluetooth\n󰍹  Monitors"
    [ -f ~/.config/hypr/bindings.conf ] && options="$options\n  Keybindings"
    [ -f ~/.config/hypr/input.conf ] && options="$options\n  Input"
    options="$options\n  Configs\n󰈷  Fingerprint\n  Fido2"

    case $(menu "Setup" "$options") in
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
        *) show_main_menu ;;
    esac
}

show_update_menu() {
    case $(menu "Update" "  Update\n󰉉  Install package\n󰭌  Remove package") in
        *Update*) terminal $SCRIPT_PATH/do-update.sh ;;
        *Install*) terminal $SCRIPT_PATH/pkg-install.sh ;;
        *Remove*) terminal $SCRIPT_PATH/pkg-remove.sh ;;
        *) show_main_menu ;;
    esac

}

show_system_menu() {
    case $(menu "System" "  Lock\n󰤄  Suspend\n  Relaunch\n󰜉  Restart\n󰐥  Shutdown") in
        *Lock*) hyprlock ;;
        *Suspend*) systemctl suspend ;;
        *Relaunch*) uwsm stop ;;
        *Restart*) systemctl reboot ;;
        *Shutdown*) systemctl poweroff ;;
        *) show_main_menu ;;
    esac
}

show_main_menu() {
    go_to_menu "$(menu "Start" "󰀻  Apps\n󰥨  Search\n󰧑  Learning\n  Capture\n󰔎  Toggle\n  Style\n  Setup\n  Update\n  About\n  System")"
}

go_to_menu() {
    case "${1,,}" in
        *apps*) rofi -i -show drun ;;
        *search*) $SCRIPT_PATH/search-home.sh ;;
        *learn*) show_learn_menu ;;
        *capture*) show_capture_menu ;;
        *toggle*) show_toggle_menu ;;
        *style*) show_style_menu ;;
        *setup*) show_setup_menu ;;
        *update*) show_update_menu ;;
        # *system*) show_system_menu ;;
        *about*) present_terminal "fastfetch";;
        *system*) wlogout -b 5 ;;
    esac
}

if [[ -n "$1" ]]; then
    go_to_menu "$1"
else
    show_main_menu
fi
