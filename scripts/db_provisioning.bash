#!/bin/bash

apt update
apt install -y mariadb-server

mv /tmp/external_connections.cnf /etc/mysql/mariadb.conf.d/99-external_connections.cnf

systemctl restart mariadb.service


sudo mariadb <<< "
 CREATE USER 'manager'@'10.10.20.%' IDENTIFIED BY 'Er3kLP2CuDur82EhUrcXdd6d8qqz';
 GRANT ALL PRIVILEGES ON *.* TO 'manager'@'10.10.20.%';
"
