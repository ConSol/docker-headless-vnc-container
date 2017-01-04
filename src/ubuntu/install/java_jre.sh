#!/usr/bin/env bash

echo "Install Java JRE 8"

apt-get update \
    && apt-get install -y openjdk-8-jre icedtea-plugin \
    && apt-get clean -y