#!/usr/bin/env bash

echo "Install some common tools for further installation"
apt-get update \
    && apt-get install -y vim wget net-tools \
    && apt-get clean -y