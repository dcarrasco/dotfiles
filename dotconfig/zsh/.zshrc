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
[ "$TERM" = "xterm-kitty" ] && fastfetch --structure Title:OS:Kernel:Packages:DW:WM:Terminal:Shell:Memory --logo $HOME/Imágenes/varios/fedora2.png --logo-type kitty-icat --logo-width 20 --key-width 12 --separator "" || fastfetch --structure Title:OS:Kernek:Packages:DW:WM:Terminal:Shell:Memory --logo none

