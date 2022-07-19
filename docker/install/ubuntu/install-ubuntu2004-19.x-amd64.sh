#!/bin/bash

export DOCKER_VERSION=5:19.03.15~3-0~ubuntu-focal
export CONTAINERD_IO_VERSION=1.6.6-1
export DOCKER_COMPOSE_VERSION=2.5.0~ubuntu-focal

sudo apt-get update
sudo apt-get install -y ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce=${DOCKER_VERSION} docker-ce-cli:amd64=${DOCKER_VERSION} containerd.io=${CONTAINERD_IO_VERSION} docker-compose-plugin=${DOCKER_COMPOSE_VERSION}
sudo usermod -aG docker ${USER}
sudo service docker start