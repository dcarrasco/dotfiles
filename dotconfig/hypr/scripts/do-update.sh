#!/bin/sh

echo -e "\e[32mUpdate system packages\e[0m"
figlet -c "Update"

os=$(grep ^NAME= /etc/os-release | cut -d = -f 2 | tr -d '"')

case ${os,,} in
    *fedora*) sudo dnf upgrade && flatpak update ;;
    *) echo No linux distro detected ;;
esac

if [ "$DESKTOP_SESSION" == "bspwm" ]; then
    echo ""
else
    bash -c "$HOME/.config/hypr/scripts/restore-waybar.sh >/dev/null 2>/dev/null &"
fi

case ${os,,} in
    *fedora*) dnf list --installed | sort > ~/installed_pkg.txt
    *) echo No linux distro detected ;;
esac

echo -e "\n\nFlatpak" >> ~/installed_pkg.txt
flatpak list >> ~/installed_pkg.txt

echo -e "\e[32mPress [ENTER]...\e[0m" && read
