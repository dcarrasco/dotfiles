#! /bin/sh

# updates=$(apt list --upgradable 2> /dev/null | grep -v "Listando" | grep -v -e "^$" | cut -d " " -f 1 | wc -l)
updates=$(dnf check-update -q | grep -Ec ' updates$')

if [ $updates -gt 0 ]; then
    echo "{\"text\": \"  ($updates)\", \"tooltip\": \"$updates actualizaciones disponibles\"}"
else
    echo "{\"text\": \"\", \"tooltip\": \"\"}"
fi
