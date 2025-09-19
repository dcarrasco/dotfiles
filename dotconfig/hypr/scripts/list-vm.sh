#!/bin/sh

OPCIONES=$(virsh --connect qemu:///system list --all | cut -c 7- | sed -E 's/[ ]+/ /g' | grep -v Nombre | grep -v "\-\-" | grep -E -v "^$" | awk -F " " '{ print $1 " (" $2 $3 ")" }')
echo 'ss'

VM=$(printf "$OPCIONES" | rofi -dmenu -p "Start VM" | cut -d " " -f 1)

echo $VM

if [ -n "$VM" ]; then
    ~/.config/hypr/scripts/start-vm.sh $VM
fi
