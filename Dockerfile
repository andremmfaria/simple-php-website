FROM ubuntu:latest

MAINTAINER Andre Faria <andremarcalfaria@gmail.com>

RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install -y php7.0-fpm nginx

COPY . /var/www/app

RUN cd /var/www/app && \
    mv nginx/app.conf /etc/nginx/sites-enabled/app.conf && \
    rm -rf .git nginx readme.md .gitignore Jenkinsfile Dockerfile

CMD ["nginx", "-g", "daemon off;"]
