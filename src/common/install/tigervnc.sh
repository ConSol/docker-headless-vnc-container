#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
yum -y install tigervnc-server
yum clean all
