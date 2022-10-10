#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y vim wget net-tools locales bzip2 \
    sudo openssh-client curl htop psmisc ncdu unar bash-completion command-not-found \
    git zsh autojump less software-properties-common \
    tigervnc-standalone-server tigervnc-viewer \
    python3-numpy #used for websockify/novnc
apt-get clean -y

echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
useradd -d /home/default -m -s /usr/bin/zsh -u 1000 -U -G sudo default
echo "default:default" | chpasswd

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8
