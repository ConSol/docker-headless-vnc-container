#!/usr/bin/env bash
echo "Install Xfce4 UI components and disable xfce-polkit"

yum --enablerepo=epel -y -x gnome-keyring --skip-broken groups install "Xfce" \
    && yum -y groups install "Fonts" \
    && yum -y install nss_wrapper gettext \
    && yum clean all \
    && rm /etc/xdg/autostart/xfce-polkit* \
    && /bin/dbus-uuidgen > /etc/machine-id