This is a Dockerfile for building GNURadio 3.7 and OpenCPN.

----------
**BUILD**

To build an image with this file use:

    $ cd docker-gnuradio
    $ sudo docker build -t gnuradio-contain .

----------

**DEPLOY**

VIRTUAL MACHINE VIRTUAL BOX with a UBUNTU 16.04 LTS DESKTOP 
https://www.virtualbox.org/wiki/Downloads

ISO:
http://releases.ubuntu.com/16.04/ubuntu-16.04.2-desktop-amd64.iso

Vagrant:
https://atlas.hashicorp.com/ubuntu/boxes/xenial64


Install docker https://docs.docker.com/engine/installation/linux/ubuntu/

connect usb after virtual machine is up 


RMMOD RTL from both host and docker container 
```
$ rmmod dvb_usb_rtl28xxu
```
Confirm no rtl drivers listed in ubuntu
```
$ lsmod | grep rtl 
<empty>
```
RUN container
```
$ xhost + 
$ sudo docker run -ti --privileged --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v /dev/usb:/dev/usb -v /dev/snd:/dev/snd normalfaults/gnuradio-big:2.0 /bin/bash
```
AIS Receiver: 
THESE COMMANDS ARE RUN INSIDE CONTAINER

Confirm no rtl drivers listed in ubuntu
```
$ lsmod | grep rtl 
<empty>
```
```
$ rmmod dvb_usb_rtl28xxu
$ sudo apt-get install socat
$ socat PTY,link=/dev/ttyS0 PTY,link=/dev/ttyS1 &
$ usermod -a -G dialout root
$ cd /ais/gr-ais-master/apps
$ python ais_rx --args="addr=192.168.10.2"
```

To run GNU Radio in X11 forwarding mode (enables GUI):

	$ xhost +
	$ sudo docker run -ti --privileged --rm -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix/:/tmp/.X11-unix \
       -v /dev/usb:/dev/usb \
       -v /dev/snd:/dev/snd \
       -v $HOME:/home/developer/working \
       gnuradio-contain \
       /bin/bash -c "/etc/rc.local; /bin/bash"
