#!/bin/sh

os=$(grep ^NAME= /etc/os-release | cut -d = -f 2 | tr -d '"')

case ${os,,} in
    *fedora*) updates=$(dnf check-update -q | grep -Ec ' updates$') ;;
    *ubuntu*) updates=$(apt list --upgradable 2> /dev/null | grep -v "Listando" | grep -v -e "^$" | cut -d " " -f 1 | wc -l) ;;
    *) echo Error: No linux distro detected ;;
esac

if [ $updates -gt 0 ]; then
    case $DESKTOP_SESSION in
        bspwm) echo " ($updates)" ;;
        *)     echo "{\"text\": \"  ($updates)\", \"tooltip\": \"$updates actualizaciones disponibles\"}" ;;
    esac
else
    case $DESKTOP_SESSION in
        bspwm) echo "" ;;
        *)     echo "{\"text\": \"\", \"tooltip\": \"\"}" ;;
    esac
fi
