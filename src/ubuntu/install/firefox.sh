#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Firefox"
apt-get update 
apt-get install -y firefox=45*
apt-mark hold firefox
apt-get clean -y