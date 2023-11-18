#!/bin/sh

is_wayland() {
    # xrandr -q | grep " connected" | grep "WAYLAND"| wc -l
    wlr-randr | grep current | wc -l
}

IS_WAYLAND="NO"
if [ $(is_wayland) -gt 0 ]; then
    IS_WAYLAND="YES"
fi


primary_monitor_fullname() {
    if [ "$IS_WAYLAND" = "NO" ]; then
        xrandr -q | grep "primary"
    else
        wlr-randr | grep -e "^[^ ]" | grep -e "^e"
    fi
}

primary_monitor_name() {
    echo "$(primary_monitor_fullname)" | cut -d " " -f 1
}

external_monitor_fullname() {
    if [ "$IS_WAYLAND" = "NO" ]; then
        xrandr -q | grep " connected" | grep -v $(primary_monitor_name)
    else
        wlr-randr | grep -e "^[^ ]" | grep -v $(primary_monitor_name)
    fi
}

external_monitor_name() {
    echo "$(external_monitor_fullname)" | cut -d " " -f 1
}

OPT_MONITOR_INT="󰌢  Solo monitor interno $(primary_monitor_fullname)"
OPT_MONITOR_EXT="󰍹  Solo monitor externo $(external_monitor_fullname)"
OPT_MONITOR_BOTH="󰍺  Ambos monitores"
OPT_SET_RESOL="󱋆  Cambiar resolucion"
OPT_SCALE_100="󰛭  Escalar al 100"
OPT_SCALE_125="󰛭  Escalar al 125"
OPT_SCALE_150="󰛭  Escalar al 150"

echo "WAYLAND: $IS_WAYLAND"
echo "$OPT_MONITOR_EXT"

opciones_un_monitor() {
    echo "$OPT_MONITOR_INT\n$OPT_SET_RESOL\n$OPT_SCALE_100\n$OPT_SCALE_125\n$OPT_SCALE_150\n"
}

opciones_dos_monitores() {
    echo "$OPT_MONITOR_INT\n$OPT_MONITOR_EXT\n$OPT_MONITOR_BOTH\n$OPT_SET_RESOL\n"
}

current_monitor_name() {
    hyprctl monitors | grep Monitor | cut -d " " -f 2
}


count_monitors() {
    if [ "$IS_WAYLAND" = "NO" ]; then
        xrandr -q | grep " connected" | wc -l
    else
        wlr-randr | grep current | wc -l
    fi
}

if [ $(count_monitors) -gt 1 ]; then
    echo "2 monitores"
    echo "Primary  : $(primary_monitor_name)"
    echo "Primary  : $(primary_monitor_fullname)"
    echo "External : $(external_monitor_name)"
    echo "External : $(external_monitor_fullname)"
    OPCIONES=$(opciones_dos_monitores)
    EXTERNAL_MONITOR=$(external_monitor_name)
else
    OPCIONES=$(opciones_un_monitor)
fi


MODO=$(printf "$OPCIONES" | rofi -dmenu -p "Monitor")


# ******** WAYLAND
echo "antes de ejecutar..."
if [ "$IS_WAYLAND" = "YES" ]; then
    echo "tenemos wayland..."
    echo "Modo : $MODO"
    echo "OPT  : $OPT_MONITOR_EXT"
    case $MODO in
        $OPT_MONITOR_INT)
            # echo $OPT_MONITOR_INT
            wlr-randr --output $(primary_monitor_name) --on --preferred --output $EXTERNAL_MONITOR --off
        ;;
        $OPT_MONITOR_EXT)
            # echo $OPT_MONITOR_EXT
            echo "wlr-randr --output $(primary_monitor_name) --off --output $EXTERNAL_MONITOR --on --preferred"
            wlr-randr --output $(primary_monitor_name) --off --output $EXTERNAL_MONITOR --on --preferred
        ;;
        $OPT_MONITOR_BOTH)
            # echo $OPT_MONITOR_BOTH
            wlr-randr --output $(primary_monitor_name) --on --preferred --output $EXTERNAL_MONITOR --on
        ;;
        $OPT_SET_RESOL)
            echo $OPT_SET_RESOL
        ;;
        $OPT_SCALE_100)
            wlr-randr --output $(current_monitor_name) --scale 1.0
        ;;
        $OPT_SCALE_125)
            wlr-randr --output $(current_monitor_name) --scale 1.25
        ;;
        $OPT_SCALE_150)
            wlr-randr --output $(current_monitor_name) --scale 1.5
        ;;
    esac
# ******** X11
else
    case $MODO in
        $OPT_MONITOR_INT)
            xrandr --output eDP --primary --auto --rotate normal --output $EXTERNAL_MONITOR --off
            bspc wm -r
        ;;
        $OPT_MONITOR_EXT)
            xrandr --output eDP --off --output $EXTERNAL_MONITOR --primary --auto --rotate normal
            bspc wm -r
        ;;
        $OPT_MONITOR_BOTH)
            xrandr --output eDP --primary --auto --rotate normal --output $EXTERNAL_MONITOR --auto --rotate normal --right-of eDP
            bspc wm -r
        ;;
        $OPT_SET_RESOL)
            arandr
            bspc wm -r
        ;;
    esac
fi


