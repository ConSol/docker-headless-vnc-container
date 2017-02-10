#!/bin/bash
### every exit != 0 fails the script
set -e

source $STARTUPDIR/generate_container_user
if [ -f $HOME/.bashrc ] ; then
    source $HOME/.bashrc
fi

## write correct window size to chrome properties
$STARTUPDIR/chrome-init.sh

## resolve_vnc_connection
VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')

## change vnc password
echo -e "\n------------------ change VNC password  ------------------"
(echo $VNC_PW && echo $VNC_PW) | vncpasswd


## start vncserver and noVNC webclient
$NO_VNC_HOME/utils/launch.sh --vnc $VNC_IP:$VNC_PORT --listen $NO_VNC_PORT &
vncserver -kill :1 && rm -rfv /tmp/.X* ; echo "remove old vnc locks to be a reattachable container"
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
$HOME/wm_startup.sh

## log connect options
echo -e "\n\n------------------ VNC environment started ------------------"
echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"
echo -e "\nnoVNC HTML client started:\n\t=> connect via http://$VNC_IP:$NO_VNC_PORT/?password=...\n"

if [[ $1 =~ -t|--tail-log ]]; then
    # if option `-t` or `--tail-log` block the execution and tail the VNC log
    echo -e "\n------------------ $HOME/.vnc/*$DISPLAY.log ------------------"
    tail -f $HOME/.vnc/*$DISPLAY.log
else
    # unknown option ==> call command
    echo -e "\n\n------------------ EXECUTE COMMAND ------------------"
    echo "Executing command: '$@'"
    exec "$@"
fi