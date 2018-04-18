# Docker container images with "headless" VNC session

The repository contains a collection of Docker images with headless VNC environments.

Each Docker image is installed with the following components:

* Desktop environment [**Xfce4**](http://www.xfce.org) or [**IceWM**](http://www.icewm.org/)
* VNC-Server (default VNC port `5901`)
* [**noVNC**](https://github.com/novnc/noVNC) - HTML5 VNC client (default http port `6901`)
* Browsers:
  * Mozilla Firefox
  * Chromium
  
![Docker VNC Desktop access via HTML page](.pics/vnc_container_view.png)

## Build Status
`master`:  [![Build Status MASTER](https://travis-ci.org/ConSol/docker-headless-vnc-container.svg?branch=master)](https://travis-ci.org/ConSol/docker-headless-vnc-container) `dev`: [![Build Status DEV](https://travis-ci.org/ConSol/docker-headless-vnc-container.svg?branch=dev)](https://travis-ci.org/ConSol/docker-headless-vnc-container)

## Current provided OS & UI sessions:
* `consol/centos-xfce-vnc`: __Centos7 with `Xfce4` UI session__ 

  [![](https://images.microbadger.com/badges/version/consol/centos-xfce-vnc.svg)](https://hub.docker.com/r/consol/centos-xfce-vnc/) [![](https://images.microbadger.com/badges/image/consol/centos-xfce-vnc.svg)](http://microbadger.com/images/consol/centos-xfce-vnc)

* `consol/ubuntu-xfce-vnc`: __Ubuntu with `Xfce4` UI session__

  [![](https://images.microbadger.com/badges/version/consol/ubuntu-xfce-vnc.svg)](https://hub.docker.com/r/consol/ubuntu-xfce-vnc/) [![](https://images.microbadger.com/badges/image/consol/ubuntu-xfce-vnc.svg)](http://microbadger.com/images/consol/ubuntu-xfce-vnc)

* `consol/centos-icewm-vnc`: __Centos7 with `IceWM` UI session__ 

  [![](https://images.microbadger.com/badges/version/consol/centos-icewm-vnc.svg)](https://hub.docker.com/r/consol/centos-icewm-vnc/) [![](https://images.microbadger.com/badges/image/consol/centos-icewm-vnc.svg)](http://microbadger.com/images/consol/centos-icewm-vnc)

* `consol/ubuntu-icewm-vnc`: __Ubuntu with `IceWM` UI session__

  [![](https://images.microbadger.com/badges/version/consol/ubuntu-icewm-vnc.svg)](https://hub.docker.com/r/consol/ubuntu-icewm-vnc/) [![](https://images.microbadger.com/badges/image/consol/ubuntu-icewm-vnc.svg)](http://microbadger.com/images/consol/ubuntu-icewm-vnc)

## OpenShift / Kubernetes

It's also possible to run the images in container orchestration platforms like [Kubernetes](https://kubernetes.io) or [OpenShift](https://openshift.io/). For more information how to deploy containers in the cluster, take a look at:

* [Kubernetes usage of "headless" VNC Docker images](./kubernetes/README.md)
* [OpenShift usage of "headless" VNC Docker images](./openshift/README.md) 

## Usage
The usage is for all provide images **similar**, for instance see following the usage of the `consol/centos-xfce-vnc` image:

Print out help page:

    docker run consol/centos-xfce-vnc --help    

Run command with mapping to local port `5901` (vnc protocol) and `6901` (vnc web access):

    docker run -d -p 5901:5901 -p 6901:6901 consol/centos-xfce-vnc
  
Change the default user and group within a container to your own with adding `--user $(id -u):$(id -g)`:

    docker run -d -p 5901:5901 -p 6901:6901 --user $(id -u):$(id -g) consol/centos-xfce-vnc

If you want to get into the container use interactive mode `-it` and `bash`     

    docker run -it -p 5901:5901 -p 6901:6901 consol/centos-xfce-vnc bash

Build an image from scratch:

    docker build -t consol/centos-xfce-vnc centos-xfce-vnc

# Connect & Control
If the container is started like mentioned above, connect via one of these options:

* connect via __VNC viewer `localhost:5901`__, default password: `vncpassword`
* connect via __noVNC HTML5 full client__: [`http://localhost:6901/vnc.html`](http://localhost:6901/vnc.html), default password: `vncpassword` 
* connect via __noVNC HTML5 lite client__: [`http://localhost:6901/?password=vncpassword`](http://localhost:6901/?password=vncpassword) 


## Hints

### 1) Extend a Image with your own software
Since `1.1.0` all images run as non-root user per default, so that means, if you want to extend the image and install software, you have to switch in the `Dockerfile` back to the `root` user:

```bash
## Custom Dockerfile
FROM consol/centos-xfce-vnc
ENV REFRESHED_AT 2018-03-18

## Install a gedit
USER 0
RUN yum install -y gedit \
    && yum clean all
## switch back to default user
USER 1000
```

### 2) Change User of running Sakuli Container

Per default, since version `1.3.0` all container processes will executed with user id `1000`. You can change the user id like follow: 

#### 2.1) Using root (user id `0`)
Add the `--user` flag to your docker run command:

    docker run -it --user 0 -p 6911:6901 consol/centos-xfce-vnc

#### 2.2) Using user and group id of host system
Add the `--user` flag to your docker run command:

    docker run -it -p 6911:6901 --user $(id -u):$(id -g) consol/centos-xfce-vnc

### 3) Override VNC environment variables
The following VNC environment variables can be overwritten at the `docker run` phase to customize your desktop environment inside the container:
* `VNC_COL_DEPTH`, default: `24`
* `VNC_RESOLUTION`, default: `1280x1024`
* `VNC_PW`, default: `my-pw`

#### 3.1) Example: Override the VNC password
Simply overwrite the value of the environment variable `VNC_PW`. For example in
the docker run command:

    docker run -it -p 5901:5901 -p 6901:6901 -e VNC_PW=my-pw consol/centos-xfce-vnc

#### 3.2) Example: Override the VNC resolution
Simply overwrite the value of the environment variable `VNC_RESOLUTION`. For example in
the docker run command:

    docker run -it -p 5901:5901 -p 6901:6901 -e VNC_RESOLUTION=800x600 consol/centos-xfce-vnc
    
### 4) View only VNC
Since version `1.2.0` it's possible to prevent unwanted control over VNC. Therefore you can set the environment variable `VNC_VIEW_ONLY=true`. If set the docker startup script will create a random cryptic password for the control connection and use the value of `VNC_PW` for the view only connection over the VNC connection.

     docker run -it -p 5901:5901 -p 6901:6901 -e VNC_VIEW_ONLY=true consol/centos-xfce-vnc

### 5) Known Issues

#### 5.1) Chromium crashes with high VNC_RESOLUTION ([#53](https://github.com/ConSol/docker-headless-vnc-container/issues/53))
If you open some graphic/work intensive websites in the Docker container (especially with high resolutions e.g. `1920x1080`) it can happen that Chromium crashes without any specific reason. The problem there is the too small `/dev/shm` size in the container. Currently there is no other way, as define this size on startup via `--shm-size` option, see [#53 - Solution](https://github.com/ConSol/docker-headless-vnc-container/issues/53#issuecomment-347265977):

    docker run --shm-size=256m -it -p 6901:6901 -e VNC_RESOLUTION=1920x1080 consol/centos-xfce-vnc chromium-browser http://map.norsecorp.com/
  
Thx @raghavkarol for the hint! 

## Contributors

At this point we want to thank all contributors, which helped to move this great project by submitting code, writing documentation, or adapting other tools to play well together with the docker headless container.

* [Tobias Schneck](https://github.com/toschneck) - Lead Development
* [Robert Bohne](https://github.com/rbo) - IceWM Images
* [hsiaoyi0504](https://github.com/hsiaoyi0504) - PR [#66](https://github.com/ConSol/docker-headless-vnc-container/pull/66)
* [dmhumph](https://github.com/dmhumph) - PR [#44](https://github.com/ConSol/docker-headless-vnc-container/issue/44) 

## Changelog

The current changelog is provided here: **[changelog.md](./changelog.md)**

## Contact
For questions, professional support or maybe some hints, feel free to contact us via **[testautomatisierung@consol.de](mailto:testautomatisierung@consol.de)** or open an [issue](https://github.com/ConSol/docker-headless-vnc-container/issues/new).

The guys behind:

**ConSol Software GmbH** <br/>
*Franziskanerstr. 38, D-81669 Munich* <br/>
*Tel. +49-89-45841-100, Fax +49-89-45841-111*<br/>
*Homepage: http://www.consol.de E-Mail: [info@consol.de](info@consol.de)*
