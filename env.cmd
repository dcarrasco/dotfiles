@echo off
rem ============================================
rem PATH
rem ============================================
set PATH_UTILBIN=c:\util\bin
set PATH_NEOVIM=c:\util\Neovim\bin
set PATH_COMPOSER=%APPDATA%\Composer\vendor\bin
set PATH=%PATH_COMPOSER%;%PATH_UTILBIN%;%PATH_NEOVIM%;%PATH%
set TMPDIR=%TMP%
rem ============================================
rem PROMPT
rem ============================================
rem ansicon -p
cls
echo Bienvenido  %USERDOMAIN%\%USERNAME%
cat %PATH_UTILBIN%\login.log

rem ============================================
rem FECHA ACTUAL
rem ============================================
rem call getfecha.bat fecha_hoy today "%%%%a %%%%d/%%%%b/%%%%Y"
date2 -d today +"Last login: %%a %%Y-%%m-%%d %%k:%%M:%%S" > %HOMEDRIVE%\util\bin\login.log

rem ============================================
rem DEFINE COLORES Y PROMPT
rem ============================================
set c_reset=$E[0m
set c_black=$E[30m
set c_gray=$E[1;30m
set c_red=$E[31m
set c_light_red=$E[1;31m
set c_green=$E[32m
set c_light_green=$E[1;32m
set c_yellow=$E[33m
set c_light_yellow=$E[1;33m
set c_blue=$E[34m
set c_light_blue=$E[1;34m
set c_magenta=$E[35m
set c_light_magenta=$E[1;35m
set c_cyan=$E[36m
set c_light_cyan=$E[1;36m
set c_white=$E[37m
set c_light_white=$E[1;37m

set PS1=%c_reset%$_
set PS1=%PS1%%USERNAME%@%COMPUTERNAME%%c_reset%$S-$S%c_light_green%$P%c_reset%$S$$$S
rem set PS1=%PS1%%c_red%%USERNAME%%c_reset%
rem set PS1=%PS1%$Sat$S%c_yellow%%COMPUTERNAME%%c_reset%
rem set PS1=%PS1%$Sin$S%c_light_green%$P%c_reset%
rem set PS1B=$_$$$S%c_reset%

prompt %PS1%%PS1B%

rem ============================================
rem CLINK
rem ============================================
%PATH_UTILBIN%\clink\clink_x64.exe inject --quiet --profile %PATH_UTILBIN%\clink\config --scripts %PATH_UTILBIN%\clink\config

rem ============================================
rem PROXY FOR COMPOSER
rem ============================================
rem set HTTP_PROXY_REQUEST_FULLURI=0
rem set HTTPS_PROXY_REQUEST_FULLURI=0

rem ============================================
rem DOCKER SETTINGS
rem ============================================
set DOCKER_TLS_VERIFY=1
set DOCKER_HOST=tcp://192.168.99.102:2376
set DOCKER_CERT_PATH=C:\Users\Daniel\.docker\machine\machines\default
set DOCKER_MACHINE_NAME=default
set COMPOSE_CONVERT_WINDOWS_PATHS=true
set DOCKER_TOOLBOX_INSTALL_PATH=C:\Program Files\Docker Toolbox
set PATH=%DOCKER_TOOLBOX_INSTALL_PATH%;%PATH%


rem ============================================
rem VIM
rem ============================================
set TERM=xterm-256color
set HOME=%HOMEDRIVE%%HOMEPATH%


rem ============================================
rem ALIASES
rem ============================================
doskey ..=cd ..
doskey ...=cd ..\..
doskey ....=cd ..\..\..
doskey .....=cd ..\..\..\..
doskey cdh=cd c:\Users\Daniel

doskey d=cd %HOMEDRIVE%%HOMEPATH%\Dropbox
doskey dl=cd %HOMEDRIVE%%HOMEPATH%\Downloads
doskey dt=cd %HOMEDRIVE%%HOMEPATH%\Desktop
doskey util=cd %HOMEDRIVE%\util
doskey o=start .
doskey h=doskey /history
doskey j=jobs
doskey st="%HOMEDRIVE%\Program Files\Sublime Text 3\sublime_text.exe" $*
doskey subl="%HOMEDRIVE%\Program Files\Sublime Text 3\sublime_text.exe" $*
doskey nv=c:\util\Neovim\bin\nvim.exe $*
doskey web=cd %HOMEDRIVE%%HOMEPATH%\Code
doskey lara=cd %HOMEDRIVE%%HOMEPATH%\Code\gastos-alpine\app\

rem VAGRANT ====================================================================
rem doskey vup=vagrant up 19efb68
rem doskey vhalt=vagrant halt 19efb68
rem doskey vsusp=vagrant suspend 19efb68
rem doskey vstatus=vagrant global-status

rem DOCKER ====================================================================
doskey dmstart=docker-machine start
doskey dmstop=docker-machine stop
doskey dc=docker-compose $*
doskey dcu=docker-compose up -d
doskey dcd=docker-compose down
doskey dce=docker-compose exec $1 sh
doskey dps=docker ps --all --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"
doskey dstop=docker stop $*
doskey drm=docker rm $*
doskey dclsa=docker container ls --all
doskey dtop=docker stats --all --format "table {{.Container}}\t{{.Name}}\t{{.CPUPerc}}   {{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"
doskey zsh=docker run -it --rm -v /c/Users/Daniel/:/home/Daniel/ -w /home/Daniel/Code zsh-alpine:latest /bin/zsh


rem GIT ====================================================================
doskey g=git $*
doskey gaa=git add --all
doskey gc=git commit -m $*
doskey nah=git reset --hard$Tgit clean -df
doskey gs=git status
doskey gg=git graph
doskey gl=git l
doskey gd=git diff

rem List all files colorized in long format
doskey l=ls -lFh --color=auto

rem List all files colorized in long format, including dot files
doskey la=ls -laFh --color=auto

rem List only directories
doskey lsd=ls -lFh --color$Bgrep "^d"

rem Always use color output for `ls`
doskey ls=ls --color=auto $*

rem Laravel specific shortcuts
doskey artisan=php artisan $*
doskey migrate=php artisan migrate $*
doskey fresh=php artisan migrate:fresh --seed $*
doskey tinker=php artisan tinker $*
doskey t=phpunit




rem ============================================
rem LS COLORS
rem ============================================
set LS_COLORS=no=00:fi=00:di=01;34:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:
rem set LS_COLORS=no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35

rem Trim new lines and copy to clipboard
rem alias c="tr -d '\n' | pbcopy"
