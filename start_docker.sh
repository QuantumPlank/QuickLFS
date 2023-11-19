#!/bin/bash

WORK_DIR=$(pwd)

DRIVE=$1

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
sudo mount $DRIVE /mnt/lfs

echo "Starting Docker Container"
docker run \
	-it \
	--rm \
	-v /mnt/lfs:/mnt/lfs  \
	$IMAGE \
	/bin/bash