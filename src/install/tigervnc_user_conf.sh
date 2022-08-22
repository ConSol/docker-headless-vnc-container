#!/usr/bin/env bash
set -e

mkdir /home/testup/.vnc

cat <<EOF > /home/testup/.vnc/config
geometry=1024x768
depth=24
EOF
