#!/bin/sh

# As chrome is already running, this is an equivalent of "open URL" function
/usr/bin/google-chrome --disable-gpu --disable-dev-shm-usage --no-sandbox -test-type --disable-infobars --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update
