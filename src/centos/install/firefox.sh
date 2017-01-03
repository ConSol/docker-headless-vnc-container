#!/usr/bin/env bash

echo "Install Firefox"
yum -y install firefox \
    && yum clean all