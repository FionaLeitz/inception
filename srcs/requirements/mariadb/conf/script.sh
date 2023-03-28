#!/bin/sh

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
    mysqld&
    until mysqladmin ping; do
        sleep 2
    done

    service mysql start;

#create database
    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

#create admin user
    mysql -e "CREATE USER '${MYSQL_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN}'@'%';"
#refresh
    mysql -e "FLUSH PRIVILEGES;"

#create user
    mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
#refresh
    mysql -e "FLUSH PRIVILEGES;"


    mysql -e "DELETE FROM mysql.user WHERE user=''"
    mysql -e "DELETE FROM mysql.user WHERE user='root'"
    mysql -e "FLUSH PRIVILEGES;"
    killall mysqld

fi
mysqld
