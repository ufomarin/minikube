#!/bin/sh

openrc default
rc-service mariadb setup

sed -i "s|.*\[mysqld\].*|\[mysqld\]\nskip-networking=false\nbind-address=0.0.0.0|g" /etc/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*skip-networking.*|skip-networking=false|g" /etc/my.cnf.d/mariadb-server.cnf

rc-service mariadb start
mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'termin';"
mysql -e "CREATE DATABASE wordpress ;"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysql wordpress < wordpress.sql

rc-service mariadb stop
mysqld_safe --datadir=/var/lib/mysql
