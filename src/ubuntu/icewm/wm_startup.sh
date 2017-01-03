#!/usr/bin/env bash
echo -e "\n------------------ startup of IceWM window manager ------------------"

/usr/bin/icewm-session > $HOME/wm.log &
sleep 1
cat $HOME/wm.log