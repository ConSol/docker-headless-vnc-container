#!/bin/bash

#resolve_vnc_connection
VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
VNC_PORT="590"${DISPLAY:1}

##change vnc password
echo "change vnc password!"
(echo $VNC_PW && echo $VNC_PW) | vncpasswd

##start vncserver and show logfile
echo -e "\nStart VNCSERVER on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer wiht $VNC_IP:$VNC_PORT"
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
sleep 1

for i in "$@"
do
case $i in
    # if option `-t` or `--tail-log` block the execution and tail the VNC log
    -t|--tail-log)
    tail -f /root/.vnc/*$DISPLAY.log
    ;;
    *)
    # unknown option ==> do nothing
    ;;
esac
done