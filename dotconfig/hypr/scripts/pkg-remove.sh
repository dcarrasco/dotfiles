#!/bin/sh

dnf list --installed | fzf --multi --preview 'dnf info -q {1}' --preview-window=down:60% | cut -d . -f 1 | xargs -ro sudo dnf remove
