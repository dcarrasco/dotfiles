PATH="$HOME/.config/composer/vendor/bin:$PATH"

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
alias d='cd /mnt/c/Users/Daniel/Dropbox'
alias dl='cd /mnt/c/Users/Daniel/Downloads'
alias dt='cd /mnt/c/Users/Daniel/Desktop'
alias util='cd /mnt/c/util'
alias o='explorer.exe'
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
alias dc='docker compose $@'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dclsa='docker container ls --all'
alias dcbuild='docker compose build --force-rm --pull'
alias dps='docker ps --all --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"'
alias dstop='docker stop'
alias drm='docker rm'
alias dtop='docker stats --all --format "table {{.Container}}\t{{.Name}}\t{{.CPUPerc}}   {{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"'
#alias alpine='docker run -it --rm -v /c/Users/Daniel/:/home/Daniel/ -v /c/Users/Daniel/Code/docker-gastos/profile:/root/.profile -w /home/Daniel/Code --env SERVICE_NAME=alpine alpine:latest /bin/sh -l'

function dce { docker compose exec --env SERVICE_NAME=$1 $1 sh -l; }
export -f dce

function drun { docker run --rm -it -v /home/daniel/:/home/daniel/ -w /home/daniel/ $1 $2; }
export -f drun


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

# Source bash_prompt ====================================================================
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# FZF options ===========================================================================
export FZF_DEFAULT_COMMAND="fdfind . $HOME"
export FZF_ALT_C_COMMAND="fdfind --type d . $HOME"
export FZF_CTRL_P_COMMAND="$FZF_DEFAULT_COMMAND"
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash

# CTRL-F para directorio y session en tmux
bind -x '"\C-f":"_tmux_fzf_"'


function _tmux_fzf_() {
    # local dir=$(find ~ -type d | fzf)
    local dir=$(fdfind --type d . ~ | fzf)
    local sess=$(basename $dir)

    tmuxsession $sess -c $dir
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

