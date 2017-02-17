FROM debian:stretch


RUN apt-get update && \  
    apt-get -qy install curl ca-certificates

RUN apt-get install --no-install-recommends -y \
	git-core \
	build-essential \
	cmake \
	pkg-config \
	libusb-1.0-0-dev \
  wget \
  python python-cheetah\
  libboost-all-dev \
  libcppunit-dev \
  fftw3 fftw3-dev pkg-config


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

RUN apt-get install -y mono-complete wget
RUN mkdir /usr/local/VR
WORKDIR /usr/local/VR
RUN wget http://www.virtualradarserver.co.uk/Files/VirtualRadar.tar.gz
RUN tar -xzvf VirtualRadar.tar.gz
COPY VirtualRadar.exe.config /usr/local/VR/
