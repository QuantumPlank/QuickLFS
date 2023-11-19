# QuickLFS

A quick setup for Linux From Scratch

## Description

QuickLFS will setup a docker container and attach a drive following the procedure provided by the LFS book, providing an environment to work on the distro without directly contaminating your host machine.

QuickLFS also provides some helper scripts for some of the steps of the LFS development

## Usage

To setup an LFS environment run:
```
./start_docker.sh <DRIVE>
```

Example
```
./start_docker.sh /dev/sdb1
```