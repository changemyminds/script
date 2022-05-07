#!/bin/bash

# 創建prometheus-storage的資料儲存區
mkdir prometheus-storage

# 創建grafana-storage的資料儲存區
mkdir grafana-storage

# 將grafana-storage的群組改為472否則會有權限問題
sudo chown -R 472:472 grafana-storage

# 將啟動服務
docker-compose up -d

# 檢查服務運行狀態
docker-compose ps
