#!/usr/bin/env bash

echo "Install TigerVNC server"
yum -y install tigervnc-server && yum clean all
