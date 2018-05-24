#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install fonts ttf-wqy-zenhei"
apt-get update 
apt-get install -y ttf-wqy-zenhei
apt-get clean -y
