#!/usr/bin/env bash
set -e -o pipefail

# Install dgoss
echo "Fetching dgoss"
curl -L https://raw.githubusercontent.com/aelsabbahy/goss/master/extras/dgoss/dgoss -o /usr/local/bin/dgoss
chmod +rx /usr/local/bin/dgoss

# Download goss to your preferred location
echo "Fetching goss"
curl -L https://github.com/aelsabbahy/goss/releases/download/v0.3.6/goss-linux-amd64 -o ~/goss-linux-amd64

# Set your GOSS_PATH to the above location
export GOSS_PATH=~/goss-linux-amd64
echo "\$GOSS_PATH: ${GOSS_PATH}"