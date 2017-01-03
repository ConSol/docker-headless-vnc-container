#!/usr/bin/env bash
CHROME_PACKAGE="chromium chromium-libs chromium-libs-media"
#CHROME_PACKAGE=http://install.linux.ncsu.edu/pub/yum/itecs/public/chromium/7/x86_64/chromium-$CHROMIUM_VERSION.el7.centos.x86_64.rpm
echo "Install Chromium Browser $CHROMIUM_VERSION"

yum -y install $CHROME_PACKAGE \
    && yum clean all\
    && ln -s /usr/bin/chromium-browser /usr/bin/google-chrome \
    && echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > /$HOME/.chromium-browser.init

#    && sed -i -e 's/exec $CMD_PREFIX "$HERE\/chrome"/exec $CMD_PREFIX "$HERE\/chrome" $CHROMIUM_FLAGS/' /opt/chromium/chrome-wrapper
# TODO fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2
