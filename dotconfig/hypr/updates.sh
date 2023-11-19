#! /bin/sh

updates=$(apt list --upgradable -a 2> /dev/null | grep -v "Listando" | grep -v -e "^$" | cut -d " " -f 1 | wc -l)

if [ $updates -gt 0 ]; then
    echo "{\"text\": \"  ($updates)\", \"tooltip\": \"$updates actualizaciones disponibles\"}"
else
    echo "{\"text\": \"\", \"tooltip\": \"\"}"
fi
