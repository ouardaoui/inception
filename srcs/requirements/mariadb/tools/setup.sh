#!/bin/sh

sed -i "s/bind-address.*$/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
 service mariadb start

mysql -u root --password="${ROOTPASS}" -e "CREATE USER '${NAMEUSR}'@'%' IDENTIFIED BY '${PASSUSR}';"
mysql -u root --password="${ROOTPASS}" -e "CREATE USER '${NAMEADMIN}'@'%' IDENTIFIED BY '${PASSADMIN}';"
mysql -u root --password="${ROOTPASS}" -e "GRANT ALL PRIVILEGES ON * . * TO '${NAMEADMIN}'@'%';"
mysql -u root --password="${ROOTPASS}" -e "CREATE DATABASE ${DBNAME};"
mysql -u root --password="" -e "ALTER USER 'root'@'%' IDENTIFIED BY '${ROOTPASS}';"
mysql -u root --password="${ROOTPASS}" -e "FLUSH PRIVILEGES;"

killall mariadbd
sleep 2

mysqld --user=root
