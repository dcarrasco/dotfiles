#!/usr/bin/env bash

OPCIONES=$(virsh --connect qemu:///system list --all | cut -c 7- | sed -E 's/[ ]+/ /g' | grep -v Nombre | grep -v "\-\-" | grep -E -v "^$" | awk -F " " '{ print $1 " (" $2 $3 ")" }')

VM=$(printf "$OPCIONES" | rofi -dmenu --markup -p "Start VM" | cut -d " " -f 1)

echo $VM

if [ -n "$VM" ]; then
    ~/.config/polybar/scripts/start-vm.sh $VM
fi
