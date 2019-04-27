FROM alpine:latest

MAINTAINER Andre Faria <andremarcalfaria@gmail.com>

RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
    php7-mbstring php7-gd nginx supervisor curl \
    && rm -rf /var/cache/apk/*

# Configure nginx PHP-FPM and supervisord
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY config/php.ini /etc/php7/conf.d/zzz_custom.ini
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chown -R nobody.nobody /run && \
	chown -R nobody.nobody /var/lib/nginx && \
	chown -R nobody.nobody /var/tmp/nginx && \
	chown -R nobody.nobody /var/log/nginx && \
	mkdir -p /var/www/html
	
COPY --chown=nobody .. /var/www/html

WORKDIR /var/www/html
	
RUN rm -rf .git .infra readme.md .gitignore Jenkinsfile Dockerfile

USER nobody
	
EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
