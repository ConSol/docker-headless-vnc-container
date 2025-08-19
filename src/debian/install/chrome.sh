#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Google Chrome"
wget -O /tmp/1.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y /tmp/1.deb
apt-get clean -y
rm -rf /tmp/1.deb
