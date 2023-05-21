#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function main () {
    state=$(virsh list --all | grep $1)

    if [[ "$state" =~ "shut off" ]]; then
        virsh start win10 &
    fi

    virt-viewer -a -f $1
}

main $1
