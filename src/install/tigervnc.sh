#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
wget -qO- https://deac-fra.dl.sourceforge.net/project/tigervnc/stable/1.12.0/tigervnc-1.12.0.x86_64.tar.gz | tar xz --strip 1 -C /

ln -s /usr/libexec/vncserver /usr/bin/vncserver
sed -i 's/exec(@cmd);/print "@cmd";\nexec(@cmd);/g' /usr/libexec/vncserver

cat << EOF > /etc/vncserver.users
:1=testup
EOF

