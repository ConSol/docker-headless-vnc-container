#!/usr/bin/env bash

echo "Install Java JRE"
SAKULI_DOWNLOAD_URL=https://labs.consol.de/sakuli/install
JAVA_VERSION=8u92
JAVA_HOME=/usr/lib/jvm/java-$JAVA_VERSION

mkdir -p $JAVA_HOME \
    # download and extract
    && wget -qO- $SAKULI_DOWNLOAD_URL/3rd-party/java/jre-$JAVA_VERSION-linux-x64.tar.gz | tar xz --strip 1 -C $JAVA_HOME \
    # set alternatives
    && update-alternatives --install "/usr/bin/java" "java" "$JAVA_HOME/bin/java" 1 \
    && update-alternatives --install "/usr/bin/javaws" "javaws" "$JAVA_HOME/bin/javaws" 1 \
    && update-alternatives --install "/usr/lib/firefox/browser/plugins/mozilla-javaplugin.so" "mozilla-javaplugin.so" "$JAVA_HOME/lib/amd64/libnpjp2.so" 1
