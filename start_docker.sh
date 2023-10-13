#!/bin/bash

WORK_DIR=$(pwd)
IMAGE_NAME=u20lfs
DRIVE=$1

mount $DRIVE /mnt/lfs

if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
	echo "Image doesn't exists locally"
	echo "Building..."
	cd $WORK_DIR/Docker
	docker build . -t $IMAGE_NAME
fi

cd $WORK_DIR

echo "Starting Docker Container"

docker run \
	-it \
	--rm \
	-v /mnt/lfs:/mnt/lfs  \
	$IMAGE_NAME \
	/bin/bash