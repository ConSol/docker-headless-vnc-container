#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components"
apt-get update
apt-get install -y xfce4 xfce4-terminal xterm xfce4-clipman-plugin
apt-get purge -y pm-utils xscreensaver*
apt-get clean -y
