#!/bin/bash

# 更新apt安裝
sudo apt-get update

# 安裝相關packages
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

# 新增 Docker 官方 GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 新增 stable 版本 repository.
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 安裝docker-ce、docker-ce-cli、containerd.io
sudo apt-get install docker-ce docker-ce-cli containerd.io

# 將目前使用者添加到docker環境內，這邊也可以直接將${USER}進行取代，另如usermod -aG docker darren
sudo usermod -aG docker ${USER}

# 啟動docker服務
sudo service docker start


