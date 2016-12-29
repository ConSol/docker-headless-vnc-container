#!/usr/bin/env bash

echo "Install some common tools for further installation"
yum -y install epel-release \
    && yum -y update \
    && yum -y install sudo wget which \
    && yum clean all