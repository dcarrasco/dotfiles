#!/bin/sh

power_profile=$(tuned-adm active | cut -d " " -f 4)
icon=""
tooltip="Profile: $power_profile (fn+Q to change)"
class=""
color=""

case $power_profile in
    "balanced-battery" | "balanced") icon=""; color="" ;;
    "throughput-performance")        icon=" ";  class="performance"; color="#f38ba8" ;;
    "powersave")                     icon="  "; class="power-saver"; color="#a6e3a1" ;;
    *)                               icon=" " ;;
esac

case $DESKTOP_SESSION in
    bspwm) [ -n "$color" ] && echo "%{F${color}}%{u${color}}%{+u}$icon%{-u}%{F-}" || echo "" ;;
    *)     echo -e "$icon\n$tooltip\n$class" ;;
esac
