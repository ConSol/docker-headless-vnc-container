#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
wget -qO- https://deac-fra.dl.sourceforge.net/project/tigervnc/stable/1.11.0/tigervnc-1.11.0.x86_64.tar.gz | tar xz --strip 1 -C /

wget https://raw.githubusercontent.com/metalefty/tigervnc/master/unix/vncserver
mv vncserver /usr/bin
chmod ugo+x /usr/bin/vncserver
