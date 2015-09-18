# This Dockerfile is used to build an sakuli image based on Centos

FROM centos:centos7
MAINTAINER Tobias Schneck "tobias.schneck@consol.de"
ENV REFRESHED_AT 2015-09-18

ENV JAVA_VERSION 8u60

ENV DISPLAY :1
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1280x1024
ENV VNC_PW vncpassword

ENV SAKULI_DOWNLOAD_URL https://labs.consol.de/sakuli/install

# Install the appropriate software
RUN yum -y install epel-release; yum clean all
RUN yum -y update; yum clean all
RUN yum -y install sudo
RUN yum --enablerepo=epel -y -x gnome-keyring --skip-broken groups install "Xfce"
RUN yum -y groups install "Fonts"
RUN yum -y install tigervnc-server wget unzip firefox

### Install java and java-plugin
RUN yum -y install $SAKULI_DOWNLOAD_URL/3rd-party/jre-$JAVA_VERSION-linux-x64.rpm
# creat symbolic link for firefox java plugin
RUN ln -s /usr/java/default/lib/amd64/libnpjp2.so /usr/lib64/mozilla/plugins/

### Install chrome browser
ADD repos /etc/yum.repos.d/
RUN yum -y install google-chrome-stable \
    && echo "alias google-chrome='/usr/bin/google-chrome --user-data-dir'" >> /root/.bashrc \
    && echo "alias google-chrome='/usr/bin/google-chrome -no-default-browser-check --user-data-dir'" >> /etc/bashrc

### CleanUp
RUN yum clean all

# xvnc server porst, if $DISPLAY=:1 port will be 5901
EXPOSE 5901

ADD .vnc /root/.vnc
ADD .config /root/.config
ADD Desktop /root/Desktop
ADD scripts /root/scripts
RUN chmod +x  /root/scripts/*.sh /root/.vnc/xstartup /etc/xdg/xfce4/xinitrc /root/Desktop/*.desktop
RUN /bin/dbus-uuidgen > /etc/machine-id

ENTRYPOINT ["/root/scripts/vnc_startup.sh"]
CMD ["--tail-log"]

