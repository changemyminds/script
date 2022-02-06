## Docker相關安裝

### Docker安裝

#### CentOS 7安裝

```bash
# 查看目前的使用者名稱
echo ${USER}

# 如果要指定使用者名稱，在使用此方式，不然可以略過
export USER=YOUR_USER_NAME

# 設定為可執行
chmod +x install_centos7.sh

#  執行安裝腳本
sudo ./install_centos7.sh
```
#### Ubuntu 安裝

```bash
# 查看目前的使用者名稱
echo ${USER}

# 如果要指定使用者名稱，在使用此方式，不然可以略過
export USER=YOUR_USER_NAME

# 設定為可執行
chmod +x install_ubuntu2004.sh

#  執行安裝腳本
sudo ./install_ubuntu2004.sh
```

### Docker Compose安裝

#### Linux
```bash
# 執行安裝腳本
sudo ./install_linux_docker-compose.sh
```

### 其他安裝問題

#### ZONE_CONFLICT: 'docker0' already bound to a zone
1. 錯誤訊息
- 安裝docker後進行啟動，發現錯誤訊息下
```bash
$ systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: failed (Result: start-limit) since Sun 2022-02-06 13:58:46 GMT; 47s ago
     Docs: https://docs.docker.com
  Process: 18499 ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock (code=exited, status=1/FAILURE)
 Main PID: 18499 (code=exited, status=1/FAILURE)

Feb 06 13:58:44 centos7-vps-3 systemd[1]: Failed to start Docker Application Container Engine.
Feb 06 13:58:44 centos7-vps-3 systemd[1]: Unit docker.service entered failed state.
Feb 06 13:58:44 centos7-vps-3 systemd[1]: docker.service failed.
Feb 06 13:58:46 centos7-vps-3 systemd[1]: docker.service holdoff time over, scheduling restart.
Feb 06 13:58:46 centos7-vps-3 systemd[1]: Stopped Docker Application Container Engine.
Feb 06 13:58:46 centos7-vps-3 systemd[1]: start request repeated too quickly for docker.service
Feb 06 13:58:46 centos7-vps-3 systemd[1]: Failed to start Docker Application Container Engine.
Feb 06 13:58:46 centos7-vps-3 systemd[1]: Unit docker.service entered failed state.
Feb 06 13:58:46 centos7-vps-3 systemd[1]: docker.service failed.
```

- 使用`journalctl -xe`查看詳細誤
```bash
$ journalctl -xe
--
-- Unit docker.service has failed.
--
-- The result is failed.
Feb 06 14:00:28 centos7-vps-3 systemd[1]: Unit docker.service entered failed state.
Feb 06 14:00:28 centos7-vps-3 systemd[1]: docker.service failed.
Feb 06 14:00:30 centos7-vps-3 sudo[18730]:      opc : TTY=pts/0 ; PWD=/usr/bin ; USER=root ; COMMAND=/bin/systemctl restart docker
Feb 06 14:00:30 centos7-vps-3 sudo[18730]: pam_unix(sudo:session): session opened for user root by opc(uid=0)
Feb 06 14:00:30 centos7-vps-3 polkitd[971]: Registered Authentication Agent for unix-process:18732:5178245087 (system bus name :1.207190 [/usrFeb 06 14:00:30 centos7-vps-3 systemd[1]: Cannot add dependency job for unit NetworkManager-wait-online.service, ignoring: Unit is masked.
Feb 06 14:00:30 centos7-vps-3 systemd[1]: Stopped Docker Application Container Engine.
-- Subject: Unit docker.service has finished shutting down
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- Unit docker.service has finished shutting down.
Feb 06 14:00:28 centos7-vps-3 dockerd[18682]: time="2022-02-06T14:00:28.210737687Z" level=info msg="Loading containers: start."
Feb 06 14:00:28 centos7-vps-3 dockerd[18682]: time="2022-02-06T14:00:28.220216924Z" level=info msg="Firewalld: docker zone already exists, retFeb 06 14:00:28 centos7-vps-3 firewalld[9119]: WARNING: COMMAND_FAILED: '/usr/sbin/iptables -w10 -t nat -D PREROUTING -m addrtype --dst-type LFeb 06 14:00:28 centos7-vps-3 firewalld[9119]: WARNING: COMMAND_FAILED: '/usr/sbin/iptables -w10 -t nat -D OUTPUT -m addrtype --dst-type LOCALFeb 06 14:00:28 centos7-vps-3 firewalld[9119]: WARNING: COMMAND_FAILED: '/usr/sbin/iptables -w10 -t nat -D OUTPUT -m addrtype --dst-type LOCALFeb 06 14:00:28 centos7-vps-3 firewalld[9119]: WARNING: COMMAND_FAILED: '/usr/sbin/iptables -w10 -t nat -D PREROUTING' failed: iptables: Bad rFeb 06 14:00:28 centos7-vps-3 firewalld[9119]: WARNING: COMMAND_FAILED: '/usr/sbin/iptables -w10 -t nat -D OUTPUT' failed: iptables: Bad rule Feb 06 14:00:28 centos7-vps-3 firewalld[9119]: WARNING: COMMAND_FAILED: '/usr/sbin/iptables -w10 -t filter -F DOCKER-ISOLATION' failed: iptablFeb 06 14:00:28 centos7-vps-3 firewalld[9119]: WARNING: COMMAND_FAILED: '/usr/sbin/iptables -w10 -t filter -X DOCKER-ISOLATION' failed: iptablFeb 06 14:00:28 centos7-vps-3 dockerd[18682]: time="2022-02-06T14:00:28.802417438Z" level=info msg="Default bridge (docker0) is assigned with Feb 06 14:00:28 centos7-vps-3 firewalld[9119]: WARNING: COMMAND_FAILED: '/usr/sbin/iptables -w10 -D FORWARD -i docker0 -o docker0 -j DROP' faiFeb 06 14:00:28 centos7-vps-3 firewalld[9119]: ERROR: ZONE_CONFLICT: 'docker0' already bound to a zone
Feb 06 14:00:28 centos7-vps-3 dockerd[18682]: failed to start daemon: Error initializing network controller: Error creating default "bridge" n

```

2. 解決方法
```bash
# 檢查docker zone是否存在firewall-cmd
$ firewall-cmd --get-active-zones
trusted
  interfaces: docker0

# 將zone切換為docker
sudo firewall-cmd --permanent --zone=docker --change-interface=docker0
success

# 再次查詢結果
$ firewall-cmd --get-active-zones
docker
  interfaces: docker0

# 重啟防火牆
sudo systemctl restart firewalld

# 再次執行docker
sudo systemctl restart docker
```

#### Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json": dial unix /var/run/docker.sock: connect: permission denied
1. 錯誤訊息
- 使用腳本安裝完後，仍然有下列問題
```bash
$ docker ps
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json": dial unix /var/run/docker.sock: connect: permission denied
```

- 檢查群組是否有異常
```bash
# 將docker加入到群組
$ sudo groupadd docker

# 將使用者加入到docker群組內
$ sudo usermod -aG docker ${USER}

# 查看群組，此時opc已經被加入
$ more /etc/group | grep docker
docker:x:992:opc

# 但使用docker指令卻顯示需要權限
docker ps
```

2. 解決方法
```bash
# 查看docker權限，發現群組為root
$ ls -al /var/run/docker.sock
srw-rw----. 1 root root 0 Feb  6 14:12 /var/run/docker.sock

# 修改群組為docker 
$ sudo chown root:docker /var/run/docker.sock

# 再次查看群組
$ ls -al /var/run/docker.sock
srw-rw----. 1 root docker 0 Feb  6 14:12 /var/run/docker.sock

# 再次執行指令，運行正常
$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```


