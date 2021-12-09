echo -e "\n--- Starting VNC server. Resolution: $1 ----"
VNC_RESOLUTION=$1

echo "remove old vnc locks to be a reattachable container"
#vncserver -kill $DISPLAY \
#    || rm -rfv /tmp/.X*-lock /tmp/.X11-unix \
#    || echo "no locks present"

echo -e "start vncserver with param: VNC_COL_DEPTH=$VNC_COL_DEPTH, VNC_RESOLUTION=$VNC_RESOLUTION\n..."


vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
echo -e "start window manager\n..."

## log connect options
echo -e "\n\n--- VNC environment started ---"
