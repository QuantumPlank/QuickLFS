FROM ubuntu:20.04

LABEL maintainer="QuantumPlank@outlook.com"
LABEL version="0.1"
LABEL description="This Docker Image is intended to be used as a build environment for LFS"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt install -y \
bash \
binutils \
bison \
coreutils \
diffutils \
findutils \
gawk \
build-essential \
grep \
gzip \
m4 \
make \
patch \
perl \
python3 \
sed \
tar \
texinfo \
xz-utils \
sudo

RUN \
ln -sf /usr/bin/bash /usr/bin/sh; \
ln -sf /usr/bin/bison /usr/bin/yacc; \
ln -sf /usr/bin/gawk /usr/bin/awk;

COPY requirements_check.sh /usr/

RUN adduser --disabled-password --gecos '' lfs
RUN adduser lfs sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo 'export LFS=/mnt/lfs' >> /home/lfs/.bash_profile
RUN echo 'export LFS=/mnt/lfs' >> /root/.bash_profile

USER lfs
