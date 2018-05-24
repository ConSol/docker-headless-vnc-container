#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components"
apt-get update 
apt-get install -y supervisor xfce4 xfce4-terminal
apt-get purge -y pm-utils xscreensaver*
apt-get clean -y

# fix https://github.com/ConSol/docker-headless-vnc-container/issues/82
ln -s /usr/bin/xfce4-terminal.wrapper /usr/bin/xterm
