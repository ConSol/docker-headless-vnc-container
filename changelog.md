## Changelog of the Docker headless VNC images

### Version 1.2.0
* Use fixed firefox version `45.9.0esr` (#39, #20, #16) 
  * fix memory consumption problems in comparison to current firefox 55
  * tested on long term container issues without crashes 
* Add en_US.UTF-8 as default locale (#27) 
* Add enviroment variable `VNC_VIEW_ONLY=true` for view only VNC connections (#25)
  * Update to tigervnc version `1.8`
* Use a more stable command for ip determination (PR #31, thx to @arnaudveron) 
* Support empty `CMD` values in startup script (#32) 
* Add chromium flag `--disable-gpu` to work for current chromium (#36) 
* Add `TERM=xterm` environment var (#37)  

### Version 1.1.0

* Add OpenShift support (#3)
   * Support for start container process as non-root in usermode (#7)
   * Add Labels for OpenShift
* Add [IceWM](http://www.icewm.org/) as alternative UI
* Remove Java installation, not needed in this image (#5)
* Refactor build structure (#5)
* Fix chromium/chrome startup (#2): Set chromium as default "chrome" and support `~/.chromium-browser.init`
* Switch from vnc4server to tigervnc (#4)
* Remove not needed Screensaver pacakges (#11)        
* Use Firefox 45 as fixed browser as long current firefox crashes (#16)
* Fix issue be starting of reattached containers on `docker start` (#15)
