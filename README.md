# Sauce

![Sauce](logo.svg)

This OS is a little fun project built with `archiso` and ment for tinkering.

## Features

Sauce installs has a simple installation script. It can be found under `archlive/airootfs/usr/local/bin/installer`.
It pulls my own build of `dwm`, `st`, and `dmenu`. Additionally will it install `sfm` the *Simple File Manager* a little project of mine.


## Build an ISO

To build your own iso run

```
sudo mkarchiso -v archlive
```

After building there will be an ISO placed under `out/`
