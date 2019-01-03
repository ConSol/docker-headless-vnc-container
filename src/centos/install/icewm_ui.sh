#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install IceWM UI components"

yum -y install xorg-x11-fonts* xulrunner icewm xauth xkbcomp
yum -y groups install "Fonts"
yum erase -y *power* *screensaver*
yum clean all
/bin/dbus-uuidgen > /etc/machine-id