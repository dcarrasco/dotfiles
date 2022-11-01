# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

unsetopt BEEP
path+=("$HOME/.config/composer/vendor/bin")
path+=("$HOME/.local/bin")

# List all files colorized in long format
alias l='ls -CF --color=auto'
alias ll='ls -lhF --color=auto'
alias la='ls -laFh --color=auto'
alias lsd="ls -lFh --color | grep '^d'"
alias ls='ls --color=auto -F'
alias l.="ls -a --color | grep --color=never '^\.'"

alias diff='diff --color'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Folders ====================================================================
alias d='cd /home/daniel/Dropbox'
alias dl='cd /home/daniel/Descargas'
alias dt='cd /home/daniel/Escritorio'
alias util='cd /mnt/c/util'
# alias o='explorer.exe'
alias h='history'
alias j='jobs'
#alias st='/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe'
#alias subl='/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe'
alias vim=nvim
alias web='cd /mnt/c/Users/Daniel/Code'
alias lara='cd /mnt/c/Users/Daniel/Code/gastos-alpine/app/'

# Docker ====================================================================
# alias dmstart=docker-machine start
# alias dmstop=docker-machine stop
alias dc='sudo docker compose $@'
alias dcu='sudo docker compose up -d'
alias dcd='sudo docker compose down'
alias dclsa='sudo docker container ls --all'
alias dcbuild='sudo docker compose build --force-rm --pull'
alias dps='sudo docker ps --all --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"'
alias dstop='sudo docker stop'
alias drm='sudo docker rm'
alias dtop='sudo docker stats --all --format "table {{.Container}}\t{{.Name}}\t{{.CPUPerc}}   {{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"'
#alias alpine='docker run -it --rm -v /c/Users/Daniel/:/home/Daniel/ -v /c/Users/Daniel/Code/docker-gastos/profile:/root/.profile -w /home/Daniel/Code --env SERVICE_NAME=alpine alpine:latest /bin/sh -l'

function dce { sudo docker compose exec --env SERVICE_NAME=$1 $1 sh -l; }
# export -f dce

function drun { sudo docker run --rm -it -v /home/daniel/:/home/daniel/ -w /home/daniel/ $1 $2; }
# export -f drun


# GIT ====================================================================
alias g=git
alias gaa='git add --all'
alias gc='git commit -m $@'
alias nah='git reset --hard | git clean -df'
alias gs='git status -s $@'
alias gg='git graph $@'
alias gl='git l $@'
alias gd='git diff $@'

# Laravel specific shortcuts ============================================================
alias artisan='php artisan'
alias dart='docker-compose exec app php artisan $@'
alias migrate='php artisan migrate'
alias fresh='php artisan migrate:fresh --seed'
alias tinker='php artisan tinker'
alias t='vendor/bin/phpunit'

# FZF options ===========================================================================
export FZF_DEFAULT_COMMAND="fdfind ."
export FZF_ALT_C_COMMAND="fdfind --type d . $HOME"
export FZF_CTRL_P_COMMAND="$FZF_DEFAULT_COMMAND"
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# CTRL-F para directorio y session en tmux
bindkey -s ^f "_tmux_fzf_\n"


function _tmux_fzf_() {
    # local dir=$(find ~ -type d | fzf)
    local dir=$(fdfind --type d . ~ ~/code --max-depth=2 | fzf)

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

