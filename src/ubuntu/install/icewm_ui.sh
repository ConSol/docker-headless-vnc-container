#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install IceWM UI components"
apt-get update 
apt-get install -y supervisor icewm vnc4server xterm
apt-get purge -y *power* *screensaver*
apt-get clean -y