#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install IceWM UI components"
apt-get update 
apt-get install -y supervisor icewm vnc4server libnss-wrapper gettext xterm 
apt-get clean -y