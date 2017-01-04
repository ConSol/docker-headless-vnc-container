#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components and disable xfce-polkit"

yum -y install nss_wrapper gettext xorg-x11-fonts* icewm
yum -y groups install "Fonts"
yum clean all
/bin/dbus-uuidgen > /etc/machine-id