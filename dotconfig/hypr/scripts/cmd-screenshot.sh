#! /bin/sh

OUTPUT_DIR=$HOME/Imágenes/Screenshots

if [[ ! -d "$OUTPUT_DIR" ]]; then
  notify-send "Screenshot directory does not exist: $OUTPUT_DIR" -u critical -t 3000
  exit 1
fi

if [[ "$1" == "region" ]]; then
    pkill slurp || grim -g "$(slurp)" $OUTPUT_DIR/$(date +"%Y%m%d_%H%M%S.png")
    notify-send "Screenshot creado (area) en archivo"
elif [[ "$1" == "clipboard" ]]; then
    pkill slurp || grim -g "$(slurp)" -t png - | wl-copy -t image/png
    notify-send "Screenshot creado (area) a clipboard"
else
    grim $OUTPUT_DIR/$(date +"%Y%m%d_%H%M%S.png")
    notify-send "Screenshot creado (pantalla)"
fi

