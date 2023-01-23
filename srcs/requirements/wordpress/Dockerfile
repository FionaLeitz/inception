FROM debian:buster

RUN apt -y update && apt -y upgrade && apt-get -y install php7.3-fpm \
    php7.3-common \
    php7.3-mysql \
    mariadb-client \
    unzip \
    curl

RUN curl -LO https://wordpress.org/latest.zip && unzip latest.zip

RUN mv wordpress /var/www

EXPOSE 9000
