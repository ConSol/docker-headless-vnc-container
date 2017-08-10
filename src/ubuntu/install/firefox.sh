#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Firefox"
apt-get update 
apt-get install -y ttf-ubuntu-font-family fonts-wqy-microhei \
    firefox language-pack-zh-hant language-pack-gnome-zh-hant
apt-mark hold firefox
apt-get clean -y
