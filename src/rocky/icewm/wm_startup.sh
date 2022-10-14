#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo -e "\n------------------ startup of IceWM window manager ------------------"

### disable screensaver and power management
xset -dpms &
xset s noblank &
xset s off &

/usr/bin/icewm-session > $HOME/wm.log &
sleep 1
### don't start a xterm
killall xterm && echo "killed not needed xterm session!"
cat $HOME/wm.log