#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y autoconf automake libtool curl make g++ unzip

PB_REL="https://github.com/protocolbuffers/protobuf/releases"
PB_VER="3.13.0"
curl -LO ${PB_REL}/download/v${PB_VER}/protoc-${PB_VER}-linux-x86_64.zip
unzip protoc-${PB_VER}-linux-x86_64.zip -d ${HOME}/.protoc
rm -f protoc-${PB_VER}-linux-x86_64.zip

tee -a /etc/profile.d/protoc.sh <<-'EOF'
# shellcheck shell=sh

protoc_path=${HOME}/.protoc/bin

if [ -n "${PATH##*${protoc_path}}" -a -n "${PATH##*${protoc_path}:*}" ]; then
    export PATH=${PATH}:${protoc_path}
fi
EOF

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base