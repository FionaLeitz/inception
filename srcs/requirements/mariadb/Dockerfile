FROM debian:buster

RUN apt -y update && apt-get -y install mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld

RUN chown -R mysql:root /run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/script.sh .

EXPOSE 3306

ENTRYPOINT ./script.sh

#CMD bash script.sh
