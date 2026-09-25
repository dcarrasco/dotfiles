# -------------------------------------------------------------------------------------------------
# History
# -------------------------------------------------------------------------------------------------
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt inc_append_history

# -------------------------------------------------------------------------------------------------
# Shell behaviuor
# -------------------------------------------------------------------------------------------------
setopt autocd
setopt nobeep
setopt numeric_glob_sort

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
zstyle ':completion:*' verbose yes
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# -------------------------------------------------------------------------------------------------
# Modular config files
# -------------------------------------------------------------------------------------------------
source $ZDOTDIR/fzf.zsh
source $ZDOTDIR/tmux.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/bindings.zsh
source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/prompt.zsh

# show ascii art on new shell
# $HOME/.config/hypr/scripts/ascii-art.sh

# show fastfetch on new shell
fastfetch --logo-type small --structure Title:OS:Kernel:Packages:DW:WM:Terminal:Shell:Memory
# FFETCH_OPTS="Title:OS:Kernel:Packages:DW:WM:Terminal:Shell:Memory"
# FFETCH_LOGO=$XDG_CONFIG_HOME/fastfetch/fedora.png
# [ $(echo $TERMINFO | grep -s kitty) ] && fastfetch --structure $FFETCH_OPTS --logo $FFETCH_LOGO --logo-type kitty-icat --logo-width 20 || fastfetch --structure $FFETCH_OPTS --logo none

