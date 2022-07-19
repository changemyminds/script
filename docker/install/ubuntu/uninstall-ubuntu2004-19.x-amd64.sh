#!/bin/bash

export DOCKER_VERSION=5:19.03.15~3-0~ubuntu-focal
export CONTAINERD_IO_VERSION=1.6.6-1
export DOCKER_COMPOSE_VERSION=2.5.0~ubuntu-focal

# stop and remove all container, network, volume, images, cache
docker system prune -af --volumes

# unistall package
sudo add-apt-repository --remove "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get purge -y ca-certificates curl software-properties-common
sudo apt-get purge -y docker-ce=${DOCKER_VERSION} docker-ce-cli:amd64=${DOCKER_VERSION} containerd.io=${CONTAINERD_IO_VERSION} docker-compose-plugin=${DOCKER_COMPOSE_VERSION}

# remove group and file
sudo groupdel docker
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
