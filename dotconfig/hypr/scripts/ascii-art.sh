ART_DIR=$HOME/.config/hypr/scripts/ascii-art

list_art=$(find $ART_DIR -type f | xargs -I $ basename $ | cut -d " " -f 1 | sort | nl)
length_art=$(find $ART_DIR -type f | wc -l)

function _random() {
    declare -i random_index=$RANDOM%$length_art
    random_index=$((random_index+1))
    random_art="$(echo "${list_art}" | sed -n ${random_index}p | tr -d ' ' | tr '\t' ' ' | cut -d ' ' -f 2)"
    exec $ART_DIR/$random_art
}

function _all() {
    for f in $(echo "$list_art" | cut -f 2); do
        echo -e "\nScript: $f"
        echo "$($ART_DIR/$f)"
    done
}

function _list() {
    echo "Hay $length_art scripts instalados"
    echo "$list_art"
}

function _help() {
    fmt_help="  %-20s\t%-54s\n"
    echo "Description: A collection of terminal color scripts."
    echo ""
    echo "Usage: colorscript [OPTION] [SCRIPT NAME/INDEX]"
    printf "${fmt_help}" \
        "-h, --help, help" "Print this help." \
        "-l, --list, list" "List all installed color scripts." \
        "-r, --random, random" "Run a random color script." \
        "-e, --exec, exec" "Run a specified color script by SCRIPT NAME or INDEX."\
        "-a, --all, all" "List the outputs of all colorscripts with their SCRIPT NAME"
}

function _exec() {
    exec $ART_DIR/$1
}


case "$#" in
    0)
        _random ;;
    1)
        case "$1" in
            random | --random | -r) _random ;;
            all | --all | -a) _all ;;
            list | --list | -l) _list ;;
            help | --help | -h) _help ;;
        esac
        ;;
    2)
        case "$1" in
            exec | --exec | -e ) _exec "$2" ;;
        esac
esac
