#!/usr/bin/env bash

echo "Install Chromium Browser"
apt-get update \
    && apt-get install -y chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg \
    && apt-get clean -y \
    && ln -s /usr/bin/chromium-browser /usr/bin/google-chrome \
    && echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > /$HOME/.chromium-browser.init
    # fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2
