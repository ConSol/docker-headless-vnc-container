#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some minimalistic tools for further installations"
apt-get update
apt-get install -y wget unzip sudo netcat vim net-tools curl tcpflow
apt-get clean -y

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8
