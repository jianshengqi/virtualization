#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y \
            build-essential \
            gcc \
            g++ \
            gdb \
            make \
            automake \
            cmake \
            autoconf \
            llvm \
            clang

# usdt lib:systemtap-sdt-dev
apt-get install -y \
            systemtap-sdt-dev