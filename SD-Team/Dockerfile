# Use phusion/baseimage as the base image. See https://github.com/phusion/baseimage-docker/
# As of 2/3/17, version 0.9.19+ does not work due to apt-get errors in Ubuntu 16.04 LTS,
# so I am using Ubuntu 14.04 LTS instead.
FROM phusion/baseimage:0.9.18

MAINTAINER rohde_zachary@bah.com version: 0.1

# These apt-get commands were taken from the Ettus tutorial:
# https://kb.ettus.com/Building_and_Installing_the_USRP_Open-Source_Toolchain_(UHD_and_GNU_Radio)_on_Linux
RUN apt-get clean && apt-get autoremove
RUN apt-get update && apt-get dist-upgrade -yf
RUN apt-get -y install git swig cmake doxygen build-essential libboost-all-dev libtool libusb-1.0-0 libusb-1.0-0-dev libudev-dev libncurses5-dev libfftw3-bin libfftw3-dev libfftw3-doc libcppunit-1.13-0 libcppunit-dev libcppunit-doc ncurses-bin cpufrequtils python-numpy python-numpy-doc python-numpy-dbg python-scipy python-docutils qt4-bin-dbg qt4-default qt4-doc libqt4-dev libqt4-dev-bin python-qt4 python-qt4-dbg python-qt4-dev python-qt4-doc python-qt4-doc libfftw3-bin libfftw3-dev libfftw3-doc ncurses-bin libncurses5 libncurses5-dev libncurses5-dbg   libfontconfig1-dev libxrender-dev libpulse-dev swig g++ automake autoconf libtool python-dev libfftw3-dev libcppunit-dev libboost-all-dev libusb-dev libusb-1.0-0-dev fort77 libsdl1.2-dev python-wxgtk2.8 git-core libqt4-dev python-numpy ccache python-opengl libgsl0-dev python-cheetah python-mako python-lxml doxygen qt4-default qt4-dev-tools libusb-1.0-0-dev libqwt5-qt4-dev libqwtplot3d-qt4-dev pyqt4-dev-tools python-qwt5-qt4 cmake git-core wget libxi-dev gtk2-engines-pixbuf r-base-dev python-tk liborc-0.4-0 liborc-0.4-dev libasound2-dev python-gtk2 libzmq1 libzmq-dev python-requests python-sphinx libcomedi-dev

# Setup and install GNU Radio using the build-gnuradio script
RUN mkdir /gnuradio
WORKDIR /gnuradio

# The build-gnuradio script installs: GNU Radio, uhd, rtl-sdr, hackrf, gr-iqba, bladeRF, gr-osmosdr, gr-baz, gr-extras
RUN apt-get -y install axel
RUN axel http://www.sbrac.org/files/build-gnuradio && chmod a+x ./build-gnuradio && printf "y\ny\ny\ny\n" | ./build-gnuradio -ut "release_003_009_001" -ja -e all

RUN echo "export PYTHONPATH=/usr/local/lib/python2.7/dist-packages" > ~/.bashrc

# Install gr-ais using the normal cmake routine
WORKDIR /
RUN mkdir /ais
WORKDIR /ais
RUN wget https://github.com/bistromath/gr-ais/archive/master.zip && unzip master.zip
WORKDIR /ais/gr-ais-master
RUN mkdir build
WORKDIR /ais/gr-ais-master/build
RUN cmake ../ && make install && ldconfig

# Install opencpn using the normal cmake routine
WORKDIR /
RUN apt-get install -y build-essential cmake gettext git-core gpsd gpsd-clients libgps-dev wx-common libwxgtk3.0-dev libglu1-mesa-dev libgtk2.0-dev wx3.0-headers libbz2-dev libtinyxml-dev libportaudio2 portaudio19-dev libcurl4-openssl-dev libexpat1-dev libcairo2-dev libpango1.0-dev
RUN ldconfig
RUN mkdir /opencpn
WORKDIR /opencpn
RUN wget https://github.com/OpenCPN/OpenCPN/archive/v4.4.0.zip && unzip v4.4.0.zip
WORKDIR /opencpn/OpenCPN-4.4.0
RUN mkdir build
WORKDIR /opencpn/OpenCPN-4.4.0/build
RUN cmake ../ && make install && ldconfig
WORKDIR /

