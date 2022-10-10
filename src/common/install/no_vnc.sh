#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
set -u

echo "Install noVNC - HTML5 based VNC viewer"
mkdir -p $NO_VNC_HOME/utils/websockify
wget -qO- https://github.com/novnc/noVNC/archive/v1.3.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME
# use older version of websockify to prevent hanging connections on offline containers, see https://github.com/ConSol/docker-headless-vnc-container/issues/50
wget -qO- https://github.com/novnc/websockify/archive/v0.10.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify
chmod +x -v $NO_VNC_HOME/utils/novnc_proxy
## create index.html to forward automatically to `vnc_lite.html`
if [ -n ${USE_VNC_LITE:-""} ]; then
	INDEX_FILE=vnc_lite.html
else
	INDEX_FILE=vnc.html
fi
cp $NO_VNC_HOME/${INDEX_FILE} $NO_VNC_HOME/index.html
