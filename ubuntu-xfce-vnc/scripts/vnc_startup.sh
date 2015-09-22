#!/bin/bash

#resolve_vnc_connection
VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
VNC_PORT="590"${DISPLAY:1}
NO_VNC_PORT="690"${DISPLAY:1}

##change vnc password
echo "change vnc password!"
(echo $VNC_PW && echo $VNC_PW) | vncpasswd

##start vncserver and noVNC webclient
$NO_VNC_HOME/utils/launch.sh --vnc $VNC_IP:$VNC_PORT --listen $NO_VNC_PORT &
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
sleep 1
##log connect options
echo -e "\n------------------ VNC environment started ------------------"
echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"
echo -e "\nnoVNC HTML client started:\n\t=> connect via http://$VNC_IP:$NO_VNC_PORT/vnc_auto.html?password=..."

for i in "$@"
do
case $i in
    # if option `-t` or `--tail-log` block the execution and tail the VNC log
    -t|--tail-log)
    echo -e "\n------------------ /root/.vnc/*$DISPLAY.log ------------------"
    tail -f /root/.vnc/*$DISPLAY.log
    ;;
    *)
    # unknown option ==> do nothing
    ;;
esac
done