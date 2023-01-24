#!/bin/sh

service mysql start;

#create database
mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"

#create admin user
mysql -e "CREATE USER '${SQL_ADMIN}'@'%' IDENTIFIED BY '${SQL_ADMIN_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${SQL_ADMIN}'@'%';"
#refresh
mysql -e "FLUSH PRIVILEGES;"

#create user
mysql -e "CREATE USER '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_USER_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON '${SQL_DATABASE}'.* TO '${SQL_USER}'@'%';"
#refresh
mysql -e "FLUSH PRIVILEGES;"


mysql -e "DELETE FROM mysql.user WHERE user=''"
mysql -e "DELETE FROM mysql.user WHERE user='root'"
mysql -e "FLUSH PRIVILEGES;"

killall mysqld
exec mysqld
