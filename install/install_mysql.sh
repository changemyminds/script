#!/bin/bash

# 基本命令如下
# --name 容器名稱為darren-mysql
# -d 背景運行
# -p 3377表示為主機Port, 3306表示mysql內部容器所使用的Port
# -e 環境參數, MYSQL_ROOT_PASSWORD表示預設密碼
# mysql: 5.7 為mysql 5.7的版本
# docker run --name darren-mysql -d -p 3377:3306 -e MYSQL_ROOT_PASSWORD=1234 mysql:5.7

# ----------分隔線----------

# 使用範例
# ./install_mysql.sh 5.7 darren-mysql 3377 1234
# 第一個參數表示Mysql版本
# 第二個參數表示為容器名稱
# 第三個參數表示為主機對外的Port
# 第四個參數表示為密碼

# 預設變數
version=5.7
name="darren-mysql"
port=3377
password=1234

if [ -z $1 ]
then
	echo "Mysql版本為空，使用預設數值代入$version"
else
	version=$1
fi	

if [ -z $2 ]
then
	echo "容器名稱為空，使用預設數值代入$name"
else
	name=$2
fi

if [ -z $3 ]
then
	echo "Port名稱為空，使用預設數值代入$port"
else
	port=$3
fi

if [ -z $4 ]
then
	echo "Port名稱為空，使用預設數值代入$password"
else
	password=$4
fi

echo "Mysql版本: $version"
echo "容器名稱: $name"
echo "主機對外的Port: $port"
echo "密碼為: $password"
echo "docker run --name $name -d -p $port:3306 -e MYSQL_ROOT_PASSWORD=$password mysql:$version"

docker run --name $name -d -p $port:3306 -e MYSQL_ROOT_PASSWORD=$password mysql:$version

