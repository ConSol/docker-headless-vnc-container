#!/usr/bin/env bash
set -e -o pipefail

DGOSS_ROOT=~/dgoss
DGOSS_EXE=$DGOSS_ROOT/dgoss
GOSS_EXE=$DGOSS_ROOT/goss-linux-amd64

# Install dgoss
echo "Creating \$DGOSS_ROOT: $DGOSS_ROOT"
mkdir -p $DGOSS_ROOT

echo "Fetching dgoss"
curl -L https://raw.githubusercontent.com/aelsabbahy/goss/master/extras/dgoss/dgoss -o $DGOSS_EXE
chmod +rx $DGOSS_EXE
export PATH=$PATH:$DGOSS_ROOT

# Download goss to your preferred location
echo "Fetching goss"
curl -L https://github.com/aelsabbahy/goss/releases/download/v0.3.6/goss-linux-amd64 -o $GOSS_EXE

# Set your GOSS_PATH to the above location
export GOSS_PATH=$GOSS_EXE
echo "\$GOSS_PATH: ${GOSS_PATH}"

cd $2
dgoss run $1
cd -