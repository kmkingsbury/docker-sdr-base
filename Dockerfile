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
