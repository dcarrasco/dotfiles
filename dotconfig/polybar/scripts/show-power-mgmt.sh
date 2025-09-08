#!/bin/sh

power_profile=$(tuned-adm active | cut -d " " -f 4)
icon=""

case $power_profile in
    "balanced-battery" | "balanced")
        icon=""
        ;;
    "throughput-performance")
        icon="%{F#f38ba8} %{F-}"
        ;;
    "powersave")
        icon="%{F#a6e3a1}  %{F-}"
        ;;
    *)
        icon=" "
        ;;
esac

echo -e "$icon"
