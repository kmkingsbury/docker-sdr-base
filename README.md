# docker-sdr-base
Base

```
docker run -d -p 1234:1234 --privileged -v /dev/bus/usb:/dev/bus/usb 
```

# Reference:

## RTL-SDR Howtos

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

