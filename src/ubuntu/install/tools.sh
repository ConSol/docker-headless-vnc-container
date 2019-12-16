#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y sudo openssh-client vim wget net-tools locales bzip2 \
    python-numpy #used for websockify/novnc
apt-get clean -y

echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "%dyno ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8
