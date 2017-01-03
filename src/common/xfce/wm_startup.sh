#!/usr/bin/env bash
echo -e "\n------------------ startup of Xfce4 window manager ------------------"
/usr/bin/startxfce4 --replace > $HOME/wm.log &
sleep 1
cat $HOME/wm.log