#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components and disable xfce-polkit"

dnf -y install xorg-x11-fonts* icewm
dnf -y groups install "Fonts"
#dnf erase -y *power* *screensaver*
dnf clean all
/bin/dbus-uuidgen > /etc/machine-id
