#!/bin/bash

URL_REPO="https://copr.fedorainfracloud.org/coprs/lionheartp/Hyprland/repo/fedora-44"
REPO="lionheartp-Hyprland-fedora-44.repo"

if [ ! -f "/etc/yum.repos.d/$REPO" ]; then
    curl "$URL_REPO/$REPO" > "/etc/yum.repos.d/$REPO"
fi

rpm-ostree install \
    hyprland \
    hyprland-guiutils \
    hyprland-qt-support \
    hyprcursor \
    hypridle \
    hyprlock \
    hyprpaper \
    hyprpicker \
    hyprpolkitagent \
    hyprsunset \
    uwsm \
    waybar-git \
    kitty \
    nwg-look \
    qt6ct \
    xdg-desktop-portal-hyprland \
    mako \
    rofi \
    wlogout

# [ ! -d $HOME/.config/hypr ]     && ln -s $HOME/dotfiles/dotconfig/hypr    $HOME/.config/hypr
# [ ! -d $HOME/.config/wayland ]  && ln -s $HOME/dotfiles/dotconfig/wayland $HOME/.config/wayland
# [ ! -d $HOME/.config/rofi ]     && ln -s $HOME/dotfiles/dotconfig/rofi    $HOME/.config/rofi
# [ ! -d $HOME/.config/mako ]     && ln -s $HOME/dotfiles/dotconfig/mako    $HOME/.config/mako
# [ ! -d $HOME/.config/wlogout ]  && ln -s $HOME/dotfiles/dotconfig/wlogout $HOME/.config/wlogout
# [ ! -d $HOME/.config/kitty ]    && ln -s $HOME/dotfiles/dotconfig/kitty   $HOME/.config/kitty

