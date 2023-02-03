#!/bin/sh

/usr/bin/geckodriver --host 0.0.0.0 --allow-hosts localhost 127.0.0.1 ${POD_IPADDR}
