# -------------------------------------------------------------------------------------------------
# History
# -------------------------------------------------------------------------------------------------
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# -------------------------------------------------------------------------------------------------
# Shell behaviuor
# -------------------------------------------------------------------------------------------------
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# -------------------------------------------------------------------------------------------------
# Smart directory navigation
# -------------------------------------------------------------------------------------------------
eval "$(zoxide init zsh)"

# -------------------------------------------------------------------------------------------------
# Completion
# -------------------------------------------------------------------------------------------------
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# -------------------------------------------------------------------------------------------------
# FZF
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

# -------------------------------------------------------------------------------------------------
# Modular config files
# -------------------------------------------------------------------------------------------------
source $ZDOTDIR/fzf.zsh
source $ZDOTDIR/tmux.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/bindings.zsh
source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/prompt.zsh
#
# $HOME/.config/hypr/scripts/ascii-art.sh
fastfetch --structure Title:OS:Kernel:Packages:DW:WM:Terminal:Shell:Memory --logo Fedora_small --key-width 12 --separator ""

