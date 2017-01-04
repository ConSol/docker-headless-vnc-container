#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo -e "\n------------------ startup of IceWM window manager ------------------"

/usr/bin/icewm-session > $HOME/wm.log &
sleep 1
cat $HOME/wm.log