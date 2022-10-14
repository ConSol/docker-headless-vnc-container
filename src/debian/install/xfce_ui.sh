#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components"
apt-get update
apt-get install -y supervisor xfce4 xfce4-terminal xterm dbus-x11 libdbus-glib-1-2
apt-get purge -y pm-utils *screensaver*
apt-get clean -y
