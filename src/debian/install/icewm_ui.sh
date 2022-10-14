#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install IceWM UI components"
apt-get update
apt-get install -y supervisor icewm xterm xfonts-base xauth xinit dbus-x11 libdbus-glib-1-2
apt-get purge -y pm-utils *screensaver*
apt-get clean -y
