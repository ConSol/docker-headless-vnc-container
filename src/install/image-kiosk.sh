#!/usr/bin/env bash

echo "Hello world"

apt-get update

echo "*** Install tools-minimal"
sh -c $INST_SCRIPTS/install/tools_minimal.sh

echo "*** Install XOrg minimal"
sh -c $INST_SCRIPTS/install/xorg_minimal.sh
echo "*** Install TigerVNC"
sh -c $INST_SCRIPTS/install/tigervnc.sh
echo "*** Setup User Permissions"
sh -c $INST_SCRIPTS/install/set_user_permission.sh

#clean up apt cache
rm -rf /var/lib/apt/lists/*
