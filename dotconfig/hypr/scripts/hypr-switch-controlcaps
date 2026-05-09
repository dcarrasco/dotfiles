#!/bin/sh

if [[ -n "$(hyprctl getoption input:kb_options | grep swapcaps)" ]]; then
    hyprctl keyword input:kb_options ctrl:
else
    hyprctl keyword input:kb_options ctrl:swapcaps
fi
