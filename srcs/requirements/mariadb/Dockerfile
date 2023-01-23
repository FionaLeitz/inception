FROM debian:buster

RUN apt -y update && apt -y upgrade && apt-get -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/script.sh .

EXPOSE 3306

CMD bash script.sh
