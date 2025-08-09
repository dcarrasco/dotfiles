#! /bin/sh
# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function main () {
    state=$(virsh --connect qemu:///system list --all | grep $1)

    if [[ "$state" =~ "apagado" ]]; then
        virsh --connect qemu:///system start $1 &
    fi

    # virt-viewer --connect=qemu:///system --attach --full-screen --hotkeys zoom-in=ctrl+alt+shift+f11,zoom-out=ctrl+alt+shift+f12 $1
    virt-viewer --connect=qemu:///system --attach --hotkeys zoom-in=ctrl+alt+shift+f11,zoom-out=ctrl+alt+shift+f12 $1
}

main $1
