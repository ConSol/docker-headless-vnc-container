#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Chromium Browser"
yum -y install chromium chromium-libs chromium-libs-media
yum clean all
