echo -e "\n--- Starting VNC server. Resolution: $1 ----"
VNC_RESOLUTION=$1
DISPLAY=":1"

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

while ! nc -z localhost 5901; do
  echo "Waiting for vncserver to launch on 5901..."
  sleep 0.5 # wait for 1/10 of the second before check again
done

echo "vncserver started..."

if [[ ! -z $START_BROWSER ]]; then
  source /dockerstartup/start_browser.sh
fi

## log connect options
echo -e "\n\n--- VNC environment started ---"
