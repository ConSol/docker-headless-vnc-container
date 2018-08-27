#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo -e "\n------------------ startup of X window manager ------------------"

### disable screensaver and power management
xset -dpms &
xset s noblank &
xset s off &

x-session-manager > $HOME/wm.log &
sleep 1
cat $HOME/wm.log
