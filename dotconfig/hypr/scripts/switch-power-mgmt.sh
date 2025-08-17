#!/bin/sh

power_profile=$(tuned-adm active | cut -d " " -f 4)
echo Current profile: $power_profile

balanced_profile="balanced"
on_battery=$(upower -d | grep on-battery | cut -d : -f 2 | xargs)
if [ "$on_battery" = "yes" ]; then
    balanced_profile="balanced-battery"
fi

case "$power_profile" in
    *$balanced_profile*) tuned-adm profile throughput-performance ;;
    *throughput-performance*) tuned-adm profile powersave ;;
    *powersave*) tuned-adm profile $balanced_profile ;;
    *) tuned-adm profile $balanced_profile ;;
esac

