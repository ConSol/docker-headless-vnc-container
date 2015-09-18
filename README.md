# docker-headless-vnc-container
Collection of Docker images with headless VNC environments. The following things are already installed:

* UI session like e.g. `xfce`
* VNC-Server with default VNC port `5901`
* Java JRE 8
* Firefox + Java Plugin
* Chrome (Java not longer supported)


### Current provided OS & UI sessions:
* Centos7:
  
  Run command with mapping to local port `5911`: `docker run -d -p 5911:5901 consol/centos-xfce-vnc`
  Build it from scratch `docker build -t consol/centos-xfce-vnc centos-xfce`
  
* Ubuntu 14.04:

  Run command with mapping to local port `5912`: `docker run -d -p 5911:5901 consol/ubuntu-xfce-vnc`
  Build it from scratch `docker build -t consol/ubuntu-xfce-vnc ubuntu-xfce`
  

### Contanct
If you further questions or maybe some hints, feel free to contact me via [tobias.schneck@consol.de]() or open an issue.
                                                                                     