#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
if [[ -n $DEBUG ]]; then
    verbose="-v"
fi

sed -i -e "/^%sudo/ s/.*/%sudo ALL=(ALL) NOPASSWD:ALL/" /etc/sudoers
touch "$HOME/.sudo_as_admin_successful"

mkdir -p $HOME/.config/google-chrome
touch $HOME/.config/google-chrome/'First Run'

echo "fix permissions for: $HOME"
find "$HOME"/ -name '*.sh' -exec chmod $verbose a+x {} +
find "$HOME"/ -name '*.desktop' -exec chmod $verbose a+x {} +
chgrp -R 0 "$HOME" && chmod -R $verbose a+rw "$HOME" && find "$HOME" -type d -exec chmod $verbose a+x {} +

cat >> $HOME/.bashrc << EOF
export PS1='\[\e[0;32m\]\u \[\e[0;36m\]\w\[\e[m\] \$ '
echo Welcome to Testup!
echo Use \"sudo apt install xxx\" to install packages from the Ubuntu universe.
echo
EOF
