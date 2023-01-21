FROM debian:buster

RUN apt -y update && apt -y upgrade && apt -y install nginx

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=fleitz.42.fr/UID=fleitz"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# RUN chmod 755 /var/www/html
# RUN chmod -R www-data:www_data /var/www/html

CMD ["nginx", "-g", "daemon off;"]