#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Installing ttf-wqy-zenhei"
apt-get install -y \
	fontconfig \
	fonts-ipafont-gothic \
	fonts-wqy-zenhei \
	fonts-thai-tlwg \
	fonts-kacst \
	fonts-symbola \
	fonts-noto \
	fonts-freefont-ttf \
	--no-install-recommends
