#!/bin/bash

export DOCKER_VERSION=5:19.03.15~3-0~ubuntu-focal
export CONTAINERD_IO_VERSION=1.6.6-1
export DOCKER_COMPOSE_VERSION=2.5.0~ubuntu-focal

sudo apt-get update
sudo apt-get install -y ca-certificates curl software-properties-common
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce=${DOCKER_VERSION} docker-ce-cli=${DOCKER_VERSION} containerd.io=${CONTAINERD_IO_VERSION} docker-compose-plugin=${DOCKER_COMPOSE_VERSION}
sudo usermod -aG docker ${USER}
sudo service docker start