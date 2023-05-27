#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function main () {
    state=$(virsh --connect qemu:///system list --all | grep $1)

    if [[ "$state" =~ "shut off" ]]; then
        virsh --connect qemu:///system start win10 &
    fi

    virt-viewer --connect=qemu:///system --attach --full-screen $1
}

main $1
