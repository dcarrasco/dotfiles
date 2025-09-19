#!/usr/bin/env bash

theme="powermenu"
DIR="$HOME/.config/rofi/powermenu"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -dmenu -theme $DIR/$theme -hover-select"

# Options
# icons         
shutdown="Apagar\0icon\x1f$DIR/icons/shutdown-white.png"
reboot="Reiniciar\0icon\x1f$DIR/icons/reboot-white.png"
lock="Bloquear\0icon\x1f$DIR/icons/lock-white.png"
suspend="Suspender\0icon\x1f$DIR/icons/suspend-white.png"
logout="Logout\0icon\x1f$DIR/icons/logout-white.png"

# Message
msg() {
	rofi -theme "$DIR/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$lock\n$logout\n$shutdown\n$suspend\n$reboot"

chosen="$(echo -e "$options" | $rofi_command -mesg "System Uptime: $uptime")"
case ${chosen,,} in
    apagar)
			systemctl poweroff
        ;;
    reiniciar)
			systemctl reboot
        ;;
    bloquear)
		if [[ -f /usr/bin/i3lock ]]; then
			i3lock
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		fi
        ;;
    suspender)
			mpc -q pause
			amixer set Master mute
			systemctl suspend
        ;;
    logout)
			if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
				i3-msg exit
			elif [[ "$DESKTOP_SESSION" == "sway" ]]; then
				swaymsg exit
			elif [[ "$DESKTOP_SESSION" == "hyprland" ]]; then
				hyprctl dispatch exit
			fi
        ;;
esac
