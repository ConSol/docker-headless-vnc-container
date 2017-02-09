#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

for var in "$@"
do
    echo "fix permissions for: $var"
    find "$var"/ -name '*.sh' -exec chmod -v a+x {} +
    find "$var"/ -name '*.desktop' -exec chmod -v a+x {} +
    chgrp -R 0 "$var" && chmod -R -v a+rw "$var" && find "$var" -type d -exec chmod -v a+x {} +
done