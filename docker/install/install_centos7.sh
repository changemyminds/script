#!/bin/bash

# 安裝yum-utlis、LVM2 和device-mapper-persistent-data
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# 使用yum-config-manager，新增一個套件類別庫進行管理
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
 
# 安裝docker-ce、docker-ce-cli、containerd.io
sudo yum install -y docker-ce docker-ce-cli containerd.io

# 防止docker沒有被新增到群組內(早期版本遇過此問題)
sudo groupadd docker
  
# 將目前使用者添加到docker環境內，這邊也可以直接將${USER}進行取代，另如usermod -aG docker darren
sudo usermod -aG docker ${USER}

# 啟動docker
sudo systemctl start docker
