FROM debian:stretch
#FROM debian:jessie

RUN apt-get clean

RUN apt-get update && \
    apt-get -qy install curl ca-certificates gnupg

# Not available under stretch (so fake with xenial)
#RUN add-apt-repository ppa:opencpn/opencpn
RUN echo "deb http://ppa.launchpad.net/opencpn/opencpn/ubuntu xenial main" >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/opencpn/opencpn/ubuntu xenial main " >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 116A13C5EDCEAB50DB00229867E4A52AC865EB40
RUN apt-get update
RUN apt-get install -y --force-yes opencpn

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


RUN apt-get install -y gnuradio

#WORKDIR /usr/local/
#RUN wget http://gnuradio.org/releases/gnuradio/gnuradio-3.7.10.tar.gz
#RUN tar -xzvf gnuradio-3.7.10.tar.gz
#WORKDIR gnuradio-3.7.10
#RUN mkdir build
#WORKDIR build
#RUN cmake ../
#RUN make && make test
#RUN make install
#RUN ldconfig

WORKDIR /usr/local/
RUN git clone https://github.com/gnuradio/gr-tutorial
WORKDIR /usr/local/gr-tutorial
RUN mkdir build
WORKDIR /usr/local/gr-tutorial/build
RUN cmake ..
RUN make -j8
RUN make install
RUN ldconfig
