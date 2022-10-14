#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components and disable xfce-polkit"

dnf --enablerepo=epel -y -x gnome-keyring --skip-broken groups install "Xfce"
dnf -y groups install "Fonts"
dnf erase -y *power* *screensaver*
dnf clean all
rm /etc/xdg/autostart/xfce-polkit*
/bin/dbus-uuidgen > /etc/machine-id
