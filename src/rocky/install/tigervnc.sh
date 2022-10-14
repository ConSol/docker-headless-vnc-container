#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
dnf install -y tigervnc-server
dnf clean all
