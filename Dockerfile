FROM resin/rpi-raspbian:jessie-20170111

RUN apt-get update && \  
    apt-get -qy install curl ca-certificates

RUN  apt-get install -y git-core
RUN  apt-get install -y git
RUN  apt-get install -y cmake
RUN  apt-get install -y libusb-1.0-0-dev
RUN  apt-get install -y build-essential
RUN apt-get install -y pkg-config
RUN git clone git://git.osmocom.org/rtl-sdr.git
WORKDIR rtl-sdr
RUN mkdir build
WORKDIR build
RUN cmake ../ -DINSTALL_UDEV_RULES=ON
RUN make
RUN  make install
RUN  ldconfig
WORKDIR /
RUN  cp /rtl-sdr/rtl-sdr.rules /etc/udev/rules.d/
RUN git clone git://github.com/MalcolmRobb/dump1090.git
WORKDIR dump1090
RUN make

