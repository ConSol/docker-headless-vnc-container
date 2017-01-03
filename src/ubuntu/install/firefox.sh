#!/usr/bin/env bash

echo "Install Firefox"
apt-get update \
    && apt-get install -y firefox \
    && apt-get clean -y