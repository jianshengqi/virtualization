#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

ats=http://www-eu.apache.org/dist/trafficserver/trafficserver-8.1.1.tar.bz2

apt-get update -y
apt-get upgrade -y
apt-get install -y \
            curl \
            locales \
            build-essential \
            bzip2 \
            libssl-dev \
            libxml2 \
            libxml2-dev \
            libpcre3 \
            libpcre3-dev \
            tcl \
            tcl-dev \
            libboost-dev

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

# Install TrafficServer
# https://trafficserver.apache.org/downloads
# http://www-eu.apache.org/dist/trafficserver
mkdir /tmp/trafficserver
cd /tmp/trafficserver
curl -L ${ats} | tar -xj --strip-components 1
./configure --prefix=/opt/ats
make install

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base
