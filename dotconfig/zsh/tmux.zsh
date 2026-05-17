# -------------------------------------------------------------------------------------------------
# tmux config file
# -------------------------------------------------------------------------------------------------

function _tmux_fzf() {
    # local dir=$(find ~ -type d | fzf)
    local dir=$(fd --type d . ~ --max-depth=4 | fzf --border --height=15 --prompt='Init tmux: ')

    if [[ -n $dir ]]; then
        local sess=$(basename $dir)
        LBUFFER+="tmuxsession $sess -c $dir"
        zle accept-line
    fi
}

function tmuxsession() {
    local session=$1
    shift

    tmux has-session -t $session 2>/dev/null

    if [ $? != 0 ]; then
        tmux new-session -s $session -d $*
    fi

    if [ -n "$TMUX" ]; then
        tmux switch-client -t $session
    else
        tmux attach-session -t $session
    fi
}

zle -N _tmux_fzf
