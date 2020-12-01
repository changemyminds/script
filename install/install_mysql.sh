#!/bin/bash

# 使用範例(一)
# ./install_mysql.sh 5.7 darren-mysql 3377 1234
# 第一個參數表示Mysql版本
# 第二個參數表示為容器名稱
# 第三個參數表示為主機對外的Port
# 第四個參數表示為密碼

# 使用範例(二)
# ./install_mysql
# 使用無參數代入，會自動使用下方的預設變數，進行啟動

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

# ----------基本指令如下----------
# [啟用mysql docker]
# docker run --name darren-mysql -d -p 3377:3306 -e MYSQL_ROOT_PASSWORD=1234 mysql:5.7
# --name 容器名稱為darren-mysql
# -d 背景運行
# -p 3377表示為主機Port, 3306表示mysql內部容器所使用的Port
# -e 環境參數, MYSQL_ROOT_PASSWORD表示預設密碼
# mysql: 5.7 為mysql 5.7的版本

# [進入到mysql資料庫指令]
# docker exec -i -t darren-mysql mysql -uroot -p1234
# -i 則讓容器的標準輸入保持打開。 
# -t 選項讓Docker分配一個虛擬終端（pseudo-tty）並綁定到容器的標準輸入上， 
# darren-mysql 容器名稱
# mysql 表示啟用mysql command
# -u 表示帳號，後面接帳號名稱
# -p 表示密碼，後面接密碼

# [進入到mysql docker內部]
# docker exec -i -t darren-mysql sh
# -i, -t同上
# sh 使用shell進入
