# -------------------------------------------------------------------------------------------------
# fzf config file
# -------------------------------------------------------------------------------------------------

# MacOS Homebrew
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
    source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
    source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# MacOS Homebrew
if [[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    source /usr/local/opt/fzf/shell/completion.zsh
fi

# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

# Fedora
if [[ -f /usr/share/fzf/shell/key-bindings.zsh ]]; then
    source /usr/share/fzf/shell/key-bindings.zsh
    # source /usr/share/fzf/shell/completion.zsh
fi

# Uses fd or fdfind
if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --strip-cwd-prefix"
elif command -v fdfind >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND="fdfind --type f --hidden --strip-cwd-prefix"
fi

# ctrl-t uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# compact UI
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border"

_fzf_file_no_hidden() {
    local cmd result
    cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
    result=$(eval "${cmd:-find . -type f}" | fzf) && LBUFFER+="$result"
    zle reset-prompt
}
zle -N _fzf_file_no_hidden

