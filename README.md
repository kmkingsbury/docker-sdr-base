# docker-sdr-base
# DOCKERHUB IMAGES
```
docker pull normalfaults\opencpn
docker pull normalfaults\gnuradio-contain
docker pull normalfaults\rtlsdr
```


## Raspberry Pi Base radio stuff.

```
docker build -t gnuradio . --network=host
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb gnuradio /bin/bash
```



## GNURadio GUI in Docker
On Linux:
```
$ xhost +
access control disabled, clients can connect from any host
$ sudo docker run --rm -i -e DISPLAY=$DISPLAY --privileged --name gnuradio gnuradio gnuradio-companion
```

on Mac (maybe after setup steps complete):
```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
# in another window (not the xquartz term)
sudo docker run --rm -i -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=192.168.148.108:0 --privileged --name gnuradio gnuradio gnuradio-companion
```
or
```
docker run --rm -i -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=192.168.148.108:0 --privileged --name gnuradio gnuradio opencpn

```



## Mac Setup Steps
```
brew install socat
brew cask install xquartz
open -a XQuartz

socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
# in another window (not the xquartz term)
docker run -e DISPLAY=192.168.59.3:0 jess/geary
```


# Errors:

### cannot open display: unix

Fixed with installing xquartz and then RESTART(!!) log out/in doesn't seem to cut it on the Mac.
```
$ docker run -it --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --name firefox ff1

(firefox:1): Gtk-WARNING **: Locale not supported by C library.
	Using the fallback 'C' locale.
Unable to init server: Broadway display type not supported: unix
Error: cannot open display: unix
```

### cannot open display:
```
Unable to init server: Broadway display type not supported: unix/private/tmp/com.apple.launchd.Tjv7B0iR2Q/org.macosforge.xquartz:0
Error: cannot open display: unix/private/tmp/com.apple.launchd.Tjv7B0iR2Q/org.macosforge.xquartz:0
```

### Unknown Cathode (terminal) Error.

```
$ sudo docker run --rm -i -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=192.168.148.108:0 --privileged --name cathode cathode
Password:
libGL error: No matching fbConfigs or visuals found
libGL error: failed to load driver: swrast
Unrecognized OpenGL version
Unrecognized OpenGL version
```

# Reference:

## Docker and GUIs:
https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

```
docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \ # mount the X11 socket
    -e DISPLAY=unix$DISPLAY \ # pass the display
    --device /dev/snd \ # sound
    --name tor-browser \
    jess/tor-browser
```
## RTL-SDR Howtos
http://www.instructables.com/id/RTL-SDR-FM-radio-receiver-with-GNU-Radio-Companion/

http://sdr.osmocom.org/trac/wiki/rtl-sdr

http://www.blackcatsystems.com/software/cocoa1090.html
https://corq.co/?p=1865

http://www.satsignal.eu/raspberry-pi/dump1090.html

http://g4vxe.blogspot.co.uk/2013/01/raspberry-pi-progress-rtladsb-wspr-wsjt.html

In DMESG when plugging in:
 /devices/platform/soc/20980000.usb/usb1/1-1/1-1.5/rc/rc0

GnuRadio News:
https://news.ycombinator.com/item?id=13406505

Docker Images for Pi:
https://hub.docker.com/r/resin/rpi-raspbian/tags/

  rtl_test -t

  ./dump1090  --interactive  --net  --net-beast  --net-ro-port 31001
