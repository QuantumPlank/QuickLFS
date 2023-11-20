#!/bin/bash

WORK_DIR=$(pwd)

DRIVE=$1

if [[ "$DRIVE" = "" ]]; then
	echo "Must specify a drive to mount"
	exit 1
fi

USER=$2

if [[ "$USER" = "" ]]; then
	echo "Must specify a user for the container"
	exit 1
fi

IMAGE_NAME=u20lfs
IMAGE_SHA=($(sha1sum Docker/Dockerfile))
IMAGE=$IMAGE_NAME:$IMAGE_SHA

echo "Checking docker image availability"
if [[ "$(docker images -q $IMAGE 2> /dev/null)" == "" ]]; then
	echo "Image doesn't exists locally"
	echo "Building..."
	cd $WORK_DIR/Docker
	docker build . -t $IMAGE
	cd $WORK_DIR
fi

echo "Mounting drive"
if [[ $(mount | grep $DRIVE) = "" ]]; then
	sudo mount $DRIVE /mnt/lfs
	if [[ $? -ne 0 ]]; then
		echo "Mount failed"
		exit 1
	fi
fi

echo "Starting Docker Container"
docker run \
	-it \
	--rm \
	-u $USER \
	-v /mnt/lfs:/mnt/lfs  \
	--privileged \
	$IMAGE \
	/bin/bash