## Changelog of the Docker headless VNC images

### Version 1.1.0

* Add OpenShift support (#3)
   * Support for start container process as non-root in usermode (#7)
   * Add Labels for OpenShift
* Add [IceWM](http://www.icewm.org/) as alternative UI
* Remove Java installation, not needed in this image (#5)
* Refactor build structure (#5)
* Fix chromium/chrome startup (#2): Set chromium as default "chrome" and support `~/.chromium-browser.init`
* Switch from vnc4server to tigervnc (#4)

