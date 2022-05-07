#!/bin/bash

# Get the image id by image_name and stop remove container
IMAGE_NAME=$1
echo "The image name is $IMAGE_NAME"
OLD_IMAGE_ID="$(docker ps -aq --filter "ancestor=$IMAGE_NAME")"
if [ -n "$OLD_IMAGE_ID" ]; then
  echo "Stop and remove docker container id: $OLD_IMAGE_ID"
  docker stop $OLD_IMAGE_ID && docker rm $OLD_IMAGE_ID
fi

# if the docker image is exist, remove it.
if [ -n "docker images -q $IMAGE_NAME 2> /dev/null" ]; then
  echo "Remove docker image name: $IMAGE_NAME"
  docker rmi $IMAGE_NAME
fi

# Get the new docker image, don't forget restart docker container
docker pull $IMAGE_NAME