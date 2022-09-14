#!/bin/bash -eux

# set version
export RANCHER_VERSION=v2.5.14
export HTTP_PORT=10080
export HTTPS_PORT=10443

sudo docker run -d --privileged --restart=unless-stopped --name=rancher \
  -p ${HTTP_PORT}:80 -p ${HTTPS_PORT}:443 \
  -v ${PWD}/rancher:/var/lib/rancher \
  rancher/rancher:${RANCHER_VERSION}