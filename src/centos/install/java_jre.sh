#!/usr/bin/env bash

echo "Install Java JRE"
SAKULI_DOWNLOAD_URL=https://labs.consol.de/sakuli/install
JAVA_VERSION=8u92

### Install java and java-plugin
yum -y install $SAKULI_DOWNLOAD_URL/3rd-party/java/jre-$JAVA_VERSION-linux-x64.rpm && yum clean all
# creat symbolic link for firefox java plugin
ln -s /usr/java/default/lib/amd64/libnpjp2.so /usr/lib64/mozilla/plugins/