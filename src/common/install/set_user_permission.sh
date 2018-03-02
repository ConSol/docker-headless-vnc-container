#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
if [[ -z $DEBUG ]]; then
    verbose="-v"
fi

for var in "$@"
do
    echo "fix permissions for: $var"
    find "$var"/ -name '*.sh' -exec chmod $verbose a+x {} +
    find "$var"/ -name '*.desktop' -exec chmod $verbose a+x {} +
    chgrp -R 0 "$var" && chmod -R $verbose a+rw "$var" && find "$var" -type d -exec chmod $verbose a+x {} +
done