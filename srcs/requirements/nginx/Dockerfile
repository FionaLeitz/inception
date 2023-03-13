FROM debian:buster

RUN apt -y update && apt -y upgrade && apt -y install nginx 

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/private/nginx.key -subj "/C=FR/ST=IDF/L=PARIS/0=42/OU=42/CN=fleitz.42.fr/UID=fleitz"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

