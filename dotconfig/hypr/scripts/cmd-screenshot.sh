#!/bin/sh

OUTPUT_DIR=$HOME/Imágenes/Screenshots
output_file=$OUTPUT_DIR/$(date +"%Y%m%d_%H%M%S.png")

if [[ ! -d "$OUTPUT_DIR" ]]; then
  notify-send "Screenshot directory does not exist: $OUTPUT_DIR" -u critical -t 3000
  exit 1
fi

case "$1" in
    region | --region)
        case $DESKTOP_SESSION in
            bspwm) maim -s $output_file ;;
            *)     pkill slurp || grim -g "$(slurp)" $output_file ;;
        esac
        notify-send "Screenshot" "Area creado en archivo"
        ;;

    clipboard | --clipboard)
        case $DESKTOP_SESSION in
            bspwm) maim -s | xclip -selection clipboard -t image/png ;;
            *)     pkill slurp || grim -g "$(slurp)" -t png - | wl-copy -t image/png ;;
        esac
        notify-send "Screenshot" "Area creado en clipboard"
        ;;

    *)
        case $DESKTOP_SESSION in
            bspwm) maim $output_file ;;
            *)     grim $output_file ;;
        esac
        notify-send "Screenshot" "Pantalla creado en archivo"
        ;;
esac

