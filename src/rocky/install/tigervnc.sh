#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
dnf install -y tigervnc-server
dnf clean all
printf '\n# docker-headless-vnc-container:\nlocalhost=no\n' >>/etc/tigervnc/vncserver-config-defaults
