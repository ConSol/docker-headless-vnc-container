#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
if [[ -n $DEBUG ]]; then
    verbose="-v"
fi

sed -i -e "/^%sudo/ s/.*/%sudo ALL=(ALL) NOPASSWD:ALL/" /etc/sudoers

var=/home/testup
echo "fix permissions for: $var"
find "$var"/ -name '*.sh' -exec chmod $verbose a+x {} +
find "$var"/ -name '*.desktop' -exec chmod $verbose a+x {} +
chgrp -R 0 "$var" && chmod -R $verbose a+rw "$var" && find "$var" -type d -exec chmod $verbose a+x {} +
