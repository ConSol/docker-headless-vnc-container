#!/usr/bin/env bash

echo "Install Xfce4 UI components"
apt-get update \
    && apt-get install -y supervisor xfce4 libnss-wrapper gettext xterm \
    && apt-get clean -y