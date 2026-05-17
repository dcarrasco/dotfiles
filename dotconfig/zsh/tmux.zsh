# -------------------------------------------------------------------------------------------------
# tmux config file
# -------------------------------------------------------------------------------------------------

function _tmux_fzf_() {
    # local dir=$(find ~ -type d | fzf)
    local dir=$(fd --type d . ~ --max-depth=4 | fzf --border --height=15 --prompt='Init tmux: ')

    if [[ -n $dir ]]; then
        local sess=$(basename $dir)
        tmuxsession $sess -c $dir
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

# CTRL-F para directorio y session en tmux
bindkey -s ^f "_tmux_fzf_\n"
