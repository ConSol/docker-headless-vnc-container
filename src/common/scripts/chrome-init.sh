#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

VNC_RES_W=${VNC_RESOLUTION%x*}
VNC_RES_H=${VNC_RESOLUTION#*x}

echo -e "\n------------------ update chromium-browser.init ------------------"
echo -e "\n... set window size $VNC_RES_W x $VNC_RES_H as chrome window size!\n"

echo "CHROMIUM_FLAGS='--no-sandbox --disable-gpu --user-data-dir --window-size=$VNC_RES_W,$VNC_RES_H --window-position=0,0'" > $HOME/.chromium-browser.init
