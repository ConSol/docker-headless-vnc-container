#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# fix icon for rocky
if test -e $HOME/Desktop/chromium-browser.desktop; then
    sed -e 's/^Icon=.*/Icon=chromium-browser/' -i $HOME/Desktop/chromium-browser.desktop
else
    :
fi

# add our flags
sed -e 's/CHROMIUM_DISTRO_FLAGS="/CHROMIUM_DISTRO_FLAGS="$CHROMIUM_FLAGS /' -i /usr/lib64/chromium-browser/chromium-browser.sh
ln -sfn /usr/lib64/chromium-browser/chromium-browser.sh /usr/bin/chromium-browser
