#! /bin/sh

power_profile=$(tuned-adm active | cut -d " " -f 4)
icon=""
tooltip="Profile: $power_profile (fn+Q to change)"
class=""

case $power_profile in
    "balanced-battery" | "balanced")
        icon=""
        ;;
    "throughput-performance")
        icon=" ."
        class="performance"
        ;;
    "powersave")
        icon="  ."
        class="power-saver"
        ;;
    *)
        icon=" "
        ;;
esac

echo -e "$icon\n$tooltip\n$class"
