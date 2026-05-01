#!/bin/sh

$HOME/.config/hypr/scripts/show-title.sh "Update system packages..."
# figlet -c "Update"

os=$(grep ^NAME= /etc/os-release | cut -d = -f 2 | tr -d '"')

case ${os,,} in
    *fedora*)
        sudo dnf upgrade && flatpak update
        dnf list --installed | sort > ~/installed_pkg.txt
        echo -e "\n\nFlatpak" >> ~/installed_pkg.txt
        flatpak list >> ~/installed_pkg.txt
        ;;
    *) echo No linux distro detected ;;
esac

# Reloads update indicator after updating system
case  "$DESKTOP_SESSION" in
    bspwm) bspc wm --restart ;;
    *)     pkill -RTMIN+7 waybar ;;
esac

