# This Dockerfile is used to build an sakuli image based on Centos
FROM centos:7
# FROM rhel7, for rhel7

MAINTAINER Robert Bohne "Robert.Bohne@ConSol.de"
ENV REFRESHED_AT 2016-08-11

LABEL io.k8s.description="Headless VNC Container with icewm, firefox and chromium" \
      io.k8s.display-name="Headless VNC Container" \
      io.openshift.expose-services="6901:http,5901:xvnc" \
      io.openshift.tags="vnc, sakuli" \
      io.openshift.non-scalable=true

ENV JAVA_VERSION 8u92

ENV DISPLAY :1
ENV NO_VNC_HOME /headless/noVNC
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1280x1024
ENV VNC_PW vncpassword

ENV SAKULI_DOWNLOAD_URL https://labs.consol.de/sakuli/install

############### xvnc / icewm installation

RUN yum install  -y epel-release && \
    yum update   -y && \
    yum install  -y --setopt=tsflags=nodocs sudo tigervnc-server wget net-tools nss_wrapper gettext which icewm xorg-x11-fonts* && \
    yum groups install -y  --setopt=tsflags=nodocs "Fonts" && \
    yum clean all -y

### Install noVNC - HTML5 based VNC viewer
RUN mkdir -p $NO_VNC_HOME/utils/websockify \
    && wget -qO- https://github.com/kanaka/noVNC/archive/v0.6.1.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME \
    && wget -qO- https://github.com/kanaka/websockify/archive/v0.8.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify \
    && chmod +x -v $NO_VNC_HOME/utils/*.sh

### Install firefox chrome browser
ADD repos /etc/yum.repos.d/
RUN yum -y install firefox google-chrome-stable && yum clean all -y
# add `--no-sandbox` to be able to start chrome inside of the docker container
RUN rm -f /etc/alternatives/google-chrome \
    && echo '/usr/bin/google-chrome-stable --no-sandbox --start-maximized --user-data-dir "$@"' > /etc/alternatives/google-chrome \
    && chmod +x /etc/alternatives/google-chrome

### Install java and java-plugin
RUN yum -y install $SAKULI_DOWNLOAD_URL/3rd-party/java/jre-$JAVA_VERSION-linux-x64.rpm && yum clean all -y
# creat symbolic link for firefox java plugin
RUN ln -s /usr/java/default/lib/amd64/libnpjp2.so /usr/lib64/mozilla/plugins/

# xvnc server porst, if $DISPLAY=:1 port will be 5901
EXPOSE 5901
# novnc web port
EXPOSE 6901

ENV HOME /headless

ADD .icewm /headless/.icewm
ADD scripts /headless/scripts

RUN chmod +x /headless/scripts/*.sh
RUN chgrp -R 0 /headless
RUN chmod -R a+rw /headless
RUN find /headless -type d -exec chmod a+x {} +

RUN /bin/dbus-uuidgen > /etc/machine-id

USER 1984

ENTRYPOINT ["/headless/scripts/vnc_startup.sh"]
CMD ["--tail-log"]
