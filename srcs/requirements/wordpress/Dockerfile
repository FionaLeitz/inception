FROM debian:buster

RUN apt -y update && apt -y upgrade && apt-get -y install php7.3-fpm \
    php7.3-common \
    php7.3-mysql \
    mariadb-client \
    unzip \
    curl

RUN mkdir -p /run/php

RUN curl -LO https://wordpress.org/latest.zip && unzip -d /var/www latest.zip

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./conf/script.sh /etc/

EXPOSE 9000

ENTRYPOINT ./etc/script.sh

#CMD ["bash", "/etc/script.sh"]
