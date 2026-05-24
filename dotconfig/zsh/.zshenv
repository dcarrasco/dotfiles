# XDG base directories --------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi

# EDITOR ----------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"

# GPG -------------------------------------------
export GPG_TTY=$(tty)

# STARSHIP --------------------------------------
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/minimal.toml

# PATH ------------------------------------------
export PATH="$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH"
