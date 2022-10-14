#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
dnf -y install epel-release
dnf -y update
dnf -y install vim sudo wget which net-tools bzip2 findutils procps \
    numpy \
    dbus-glib \
    psmisc
dnf -y install mailcap
dnf clean all
