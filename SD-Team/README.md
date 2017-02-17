This is a Dockerfile for building GNURadio 3.7 and OpenCPN.

----------
**BUILD**

To build an image with this file use:

    $ cd docker-gnuradio
    $ sudo docker build -t gnuradio-contain .

----------

**DEPLOY**

To run GNU Radio in X11 forwarding mode (enables GUI):

	$ xhost +
	$ sudo docker run -ti --privileged --rm -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix/:/tmp/.X11-unix \
       -v /dev/usb:/dev/usb \
       -v /dev/snd:/dev/snd \
       -v $HOME:/home/developer/working \
       gnuradio-contain \
       /bin/bash -c "/etc/rc.local; /bin/bash"