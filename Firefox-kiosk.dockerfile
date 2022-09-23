# This Dockerfile is used to build an headles vnc image based on Ubuntu
FROM ubuntu:18.04

MAINTAINER Simon Hofmann "simon.hofmann@consol.de"
ENV REFRESHED_AT 2018-10-29

LABEL io.k8s.description="Headless VNC Container with Xfce window manager, firefox and chromium" \
      io.k8s.display-name="Headless VNC Container based on Ubuntu" \
      io.openshift.expose-services="6901:http,5901:xvnc" \
      io.openshift.tags="vnc, ubuntu, xfce" \
      io.openshift.non-scalable=true

## Connection ports for controlling the UI:
# VNC port:5901
ENV DISPLAY=:1 \
    VNC_PORT=5901
EXPOSE $VNC_PORT

### Envrionment config
ENV HOME=/home/testup \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/headless/src \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false \
    LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8'

ENV START_BROWSER=true

WORKDIR $INST_SCRIPTS

ADD /src .
RUN ./install/image.sh

RUN ./install/firefox.sh

COPY /src/scripts /dockerstartup
COPY /src/startup/start_firefox.sh /dockerstartup/start_browser.sh

### Setup user
RUN useradd -u 1000 -m -s /bin/bash -G sudo testup

WORKDIR /home/testup
USER 1000

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--wait"]
