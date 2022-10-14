#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Chromium Browser"
apt-get install -y chromium
ln -sfn /usr/bin/chromium /usr/bin/chromium-browser
apt-get clean -y
