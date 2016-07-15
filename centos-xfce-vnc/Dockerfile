# This Dockerfile is used to build an sakuli image based on Centos

FROM centos:7

MAINTAINER Tobias Schneck "tobias.schneck@consol.de"
ENV REFRESHED_AT 2016-10-21

ENV JAVA_VERSION 8u92

ENV DISPLAY :1
ENV NO_VNC_HOME /headless/noVNC
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1280x1024
ENV VNC_PW vncpassword

ENV SAKULI_DOWNLOAD_URL https://labs.consol.de/sakuli/install

############### xvnc / xfce installation
RUN yum -y install epel-release && yum -y update && yum -y install sudo && yum clean all -y
RUN yum --enablerepo=epel -y -x gnome-keyring --skip-broken groups install "Xfce" && yum clean all -y
RUN yum -y groups install "Fonts" && yum clean all -y
RUN yum -y install tigervnc-server wget which net-tools nss_wrapper gettext && yum clean all -y
### Install noVNC - HTML5 based VNC viewer
RUN mkdir -p $NO_VNC_HOME/utils/websockify \
    && wget -qO- https://github.com/kanaka/noVNC/archive/v0.6.1.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME \
    && wget -qO- https://github.com/kanaka/websockify/archive/v0.8.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify \
    && chmod +x -v /headless/noVNC/utils/*.sh

### Install firefox chrome browser
ENV CHROMIUM_VERSION 53.0.2785.116-1
RUN yum -y install firefox http://install.linux.ncsu.edu/pub/yum/itecs/public/chromium/7/x86_64/chromium-$CHROMIUM_VERSION.el7.centos.x86_64.rpm \
        && yum clean all -y\
        && ln -s /usr/bin/chromium-browser /usr/bin/google-chrome
# fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2
RUN sed -i -e 's/exec $CMD_PREFIX "$HERE\/chrome"/exec $CMD_PREFIX "$HERE\/chrome" $CHROMIUM_FLAGS/' /opt/chromium/chrome-wrapper
ENV CHROMIUM_FLAGS "--no-sandbox --start-maximized --user-data-dir"

### Install java and java-plugin
RUN yum -y install $SAKULI_DOWNLOAD_URL/3rd-party/java/jre-$JAVA_VERSION-linux-x64.rpm && yum clean all
# creat symbolic link for firefox java plugin
RUN ln -s /usr/java/default/lib/amd64/libnpjp2.so /usr/lib64/mozilla/plugins/

# xvnc server porst, if $DISPLAY=:1 port will be 5901
EXPOSE 5901
# novnc web port
EXPOSE 6901

ENV HOME /headless

ADD .vnc /headless/.vnc
ADD .config /headless/.config
ADD Desktop /headless/Desktop
ADD scripts /headless/scripts

RUN chmod +x /headless/scripts/*.sh /headless/.vnc/xstartup /etc/xdg/xfce4/xinitrc /headless/Desktop/*.desktop
RUN chgrp -R 0 /headless
RUN chmod -R g+rw /headless
RUN find /headless -type d -exec chmod g+x {} +

RUN /bin/dbus-uuidgen > /etc/machine-id

USER 1984

ENTRYPOINT ["/headless/scripts/vnc_startup.sh"]
CMD ["--tail-log"]
