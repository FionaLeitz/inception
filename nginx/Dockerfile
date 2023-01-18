FROM debian:buster

RUN apt-get update && apt-get -y install nginx

#COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
