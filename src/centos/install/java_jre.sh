#!/usr/bin/env bash

echo "Install Java JRE 8"

yum -y install java-1.8.0-openjdk icedtea-web \
    && yum clean all