#!/usr/bin/env bash

echo "Install IceWM UI components"
apt-get update \
    && apt-get install -y supervisor icewm libnss-wrapper gettext xterm \
    && apt-get clean -y