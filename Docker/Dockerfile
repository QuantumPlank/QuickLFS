FROM ubuntu:20.04

LABEL maintainer="QuantumPlank@outlook.com"
LABEL version="0.1"
LABEL description="This Docker Image is intended to be used as a build environment for LFS"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# Install Host packages
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

# Create symlinks
RUN \
ln -sf /usr/bin/bash /usr/bin/sh; \
ln -sf /usr/bin/bison /usr/bin/yacc; \
ln -sf /usr/bin/gawk /usr/bin/awk;

# Install additional utilities
RUN apt install -y \
vim \
wget

# Create lfs user
RUN adduser --disabled-password --gecos '' lfs
RUN adduser lfs sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Copy utility scripts to docker fs
COPY scripts/* /usr/

# Copy utility files to docker fs
COPY files/* /home/lfs