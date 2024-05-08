#!/usr/bin/env bash
### every exit != 0 fails the script
set -ex


echo "Install Chrome Browser"
apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	--no-install-recommends

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y ./google-chrome-stable_current_amd64.deb

rm ./google-chrome-stable_current_amd64.deb

curl https://storage.googleapis.com/chrome-for-testing-public/124.0.6367.91/linux64/chromedriver-linux64.zip -o /tmp/chromedriver.zip
unzip /tmp/chromedriver.zip -d /tmp
rm /tmp/chromedriver.zip
mv /tmp/chromedriver-linux64/chromedriver /usr/bin/chromedriver

rm -rf /var/lib/apt/lists/*
# libasound2:amd64
