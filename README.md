# Docker containers with "headless" VNC session
The repository contains a collection of Docker images with headless VNC environments. The following things are already installed:

* UI session like e.g. `xfce`
* VNC-Server with default VNC port `5901`
* Java JRE 8
* Firefox + Java Plugin
* Chrome (Java not longer supported)

### Current provided OS & UI sessions:
* __Centos7:__

  Run command with mapping to local port `5911`: `docker run -d -p 5911:5901 consol/centos-xfce-vnc`
  Build image from scratch: `docker build -t consol/centos-xfce-vnc centos-xfce-vnc`

  __=> connecti via VNC viewer `localhost:5911`__, default password:`vncpassword`

* __Ubuntu 14.04:__

  Run command with mapping to local port `5912`: `docker run -d -p 5912:5901 consol/ubuntu-xfce-vnc`
  Build image from scratch: `docker build -t consol/ubuntu-xfce-vnc ubuntu-xfce-vnc`

  __=> connecti via VNC viewer `localhost:5912`__, default password:`vncpassword`

### Hints
#### override the VNC password
Simple override the value of the environment variable `VNC_PW`. For example in
the docker run command:

    docker run -it -p 5911:5901 -e "VNC_PW=my-new-password" consol/centos-xfce-vnc

### Contanct
If you further questions or maybe some hints, feel free to contact me via [tobias.schneck@consol.de]() or open an [issue](https://github.com/ConSol/docker-headless-vnc-container/issues/new).

<table>
<tr>
<td>
**ConSol* Consulting & Solutions Software GmbH** <br/>
*Franziskanerstr. 38, D-81669 München* <br/>
*Tel. +49-89-45841-100, Fax +49-89-45841-111*<br/>
*Homepage: http://www.consol.de E-Mail: [info@consol.de](info@consol.de)*
</td>
</tr>
<table>
