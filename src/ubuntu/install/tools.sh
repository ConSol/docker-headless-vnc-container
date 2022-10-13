#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo y | unminimize

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y vim wget net-tools locales bzip2 \
    sudo openssh-client curl htop psmisc ncdu unar bash-completion command-not-found \
    git zsh tmux autojump less software-properties-common \
    tigervnc-standalone-server tigervnc-viewer \
    python3-numpy #used for websockify/novnc
apt-get clean -y

echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
useradd -d /home/default -m -s /usr/bin/zsh -u 1000 -U -G sudo default
echo "default:default" | chpasswd

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8

### install firefox
function install_firefox(){
apt-get update
apt install -y software-properties-common 
add-apt-repository -y ppa:mozillateam/ppa
# run `apt-cache policy` and inpect for following `Pin` section text
# the Pin-Priority should be larger than the default ubuntu source
cat > /etc/apt/preferences.d/mozillateam-ppa-pin-700 <<EOF
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 700
EOF
apt update
apt install -y firefox
}

install_firefox
