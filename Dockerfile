FROM resin/rpi-raspbian:jessie-20170111

RUN apt-get update && \  
    apt-get -qy install curl ca-certificates

RUN apt-get install --no-install-recommends -y \
	git-core \
	build-essential \
	cmake \
	pkg-config \
	libusb-1.0-0-dev

WORKDIR /usr/local/
RUN git clone git://git.osmocom.org/rtl-sdr.git
RUN mkdir /usr/local/rtl-sdr/build

WORKDIR /usr/local/rtl-sdr/build
RUN cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON
RUN make
RUN make install
RUN ldconfig

RUN  cp /usr/local/rtl-sdr/rtl-sdr.rules /etc/udev/rules.d/
RUN git clone git://github.com/MalcolmRobb/dump1090.git
WORKDIR dump1090
RUN make

