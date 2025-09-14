#!/bin/bash

apt update
apt install -y mariadb-server

mv /tmp/my.cnf /etc/mysql/my.cnf

systemctl restart mariadb.service


sudo mariadb <<< "
 CREATE USER 'manager'@'10.10.20.%' IDENTIFIED BY 'Er3kLP2CuDur82EhUrcXdd6d8qqz';
 GRANT ALL PRIVILEGES ON *.* TO 'manager'@'10.10.20.%';
"
