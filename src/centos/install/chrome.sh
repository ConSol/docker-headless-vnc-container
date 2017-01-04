#!/usr/bin/env bash

echo "Install Chromium Browser"
yum -y install chromium chromium-libs chromium-libs-media \
    && yum clean all\
    && ln -s /usr/bin/chromium-browser /usr/bin/google-chrome \
    && echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > /$HOME/.chromium-browser.init \
    && sed -i '$isource ~/install/chromium-wrapper' /usr/lib64/chromium-browser/chromium-browser.sh
    ## add `source ~/install/chromium-wrapper`string before last line
    # fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2