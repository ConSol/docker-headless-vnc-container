#!/usr/bin/env bash

echo "Install some common tools for further installation"
yum -y install epel-release \
    && yum -y update \
    && yum -y install vim sudo wget which net-tools \
    && yum clean all