FROM ubuntu:22.04

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
gcc \
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
xz-utils
