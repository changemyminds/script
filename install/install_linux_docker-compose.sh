#!/bin/bash

# 安裝docker-compose，下載docker compose
sudo curl -SL "https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 
# 查看安裝路徑
ls -al /usr/local/bin/docker-compose

# 改變權限，讓docker-compose變為可以執行
sudo chmod +x /usr/local/bin/docker-compose

# 查看修改完權限後的結果
ls -al /usr/local/bin/docker-compose

# 測試docker-compose指令
docker-compose -v
