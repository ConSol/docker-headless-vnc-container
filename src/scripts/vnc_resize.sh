echo -e "\n--- Starting VNC server. Resolution: $1 ----"
VNC_RESOLUTION=$1

echo "remove old vnc locks to be a reattachable container"
killall Xvnc \
    || rm -rfv /tmp/.X*-lock /tmp/.X11-unix \
    || echo "no locks present"

echo -e "start vncserver with param: VNC_COL_DEPTH=$VNC_COL_DEPTH, VNC_RESOLUTION=$VNC_RESOLUTION\n..."

cat << EOF > /home/testup/.vnc/config
geometry=$VNC_RESOLUTION
depth=$VNC_COL_DEPTH
SendPrimary=0
EOF

vncserver $DISPLAY &

echo -e "waiting 5 seconds for vncserver to start \n..."

sleep 5


## log connect options
echo -e "\n\n--- VNC environment started ---"
