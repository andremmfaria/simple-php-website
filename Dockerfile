FROM ubuntu:latest

MAINTAINER Andre Faria <andremarcalfaria@gmail.com>

RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install -y php-fpm nginx



COPY nginx/website.conf /etc/nginx/sites-enabled/website.conf

COPY 
