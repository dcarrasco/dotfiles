#HIST_FIND_NO_DUPS List all files colorized in long format
alias l='ls -CF --color=auto'
alias ll='ls -lhF --color=auto --group-directories-first'
alias la='ls -laFhA --color=auto --group-directories-first'
alias lsd="ls -lFh --color=auto | grep --color=none '^d'"
alias ls='ls --color=auto -F'
alias l.="ls -a --color=auto | grep --color=never '^\.'"

alias cp='cp -i'
alias mv='mv -i'
alias diff='diff --color=auto'
alias ps='ps -auf'
alias rm='trash -v'
# alias grep='rg --color=auto'
alias df='df -h'


alias cd..="cd .."
alias ..="cd ..;pwd"
alias ...="cd ../..;pwd"
alias ....="cd ../../..;pwd"
alias .....="cd ../../../..;pwd"
alias ~="cd ~"     # `cd` is probably faster to type though
alias -- -="cd -"

alias mountedinfo='df -hT'
alias folders='du -h --max-depth=1'
alias rmd='rm --recursive --verbose'
alias dnff="dnf list | fzf --multi --height 100% --preview 'dnf info -q {1}' --preview-window=down:70%"

# Folders ====================================================================
alias d='cd ~/Dropbox'
alias dl='cd ~/Descargas'
alias dt='cd ~/Escritorio'
# alias util='cd /mnt/c/Users/Daniel\ Carrasco/Util'
# alias o='explorer.exe'
alias h='history'
alias j='jobs'
#alias st='/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe'
#alias subl='/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe'
alias vim=nvim
alias nv=nvim
alias ssh='TERM=xterm-256color ssh'
alias python=python3
alias web='cd /mnt/c/Users/Daniel/Code'
alias lara='cd /mnt/c/Users/Daniel/Code/gastos-alpine/app/'

# Docker / podman =================================================================
# alias dmstart=docker-machine start
# alias dmstop=docker-machine stop
alias docker=podman
alias dc='podman-compose $@'
alias dcu='podman-compose up -d'
alias dcd='podman-compose down'
alias dclsa='podman container ls --all'
alias dcbuild='podman-compose build --force-rm --pull'
alias dps='podman ps --all --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"'
alias dstop='podman stop'
alias drm='podman rm'
alias dtop='podman stats --all --format "table {{.Container}}\t{{.Name}}\t{{.CPUPerc}}   {{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"'
#alias alpine='docker run -it --rm -v /c/Users/Daniel/:/home/Daniel/ -v /c/Users/Daniel/Code/docker-gastos/profile:/root/.profile -w /home/Daniel/Code --env SERVICE_NAME=alpine alpine:latest /bin/sh -l'
alias nasdocker='ssh -t qnap /share/CACHEDEV1_DATA/.qpkg/container-station/bin/docker $@'

function dce { podman-compose exec --env SERVICE_NAME=$1 $1 bash -l; }
# export -f dce

function drun { podman run --rm -it -v /home/daniel/:/home/daniel/:z -w /home/daniel/ $1 $2; }
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
alias dart='podman compose exec app php artisan $@'
alias migrate='php artisan migrate'
alias fresh='php artisan migrate:fresh --seed'
alias tinker='php artisan tinker'
alias t='vendor/bin/phpunit'

# typst options ===========================================================================
function typst() {
    podman run --rm -it --init -v "$(pwd):/root:z" -v "$HOME/.local/share/fonts:/fonts:z" ghcr.io/typst/typst:latest $1 --font-path=/fonts /root/$2 $3 $4

}

# vim: set ft=sh :
