# Set nginx base image
FROM nginx:alpine

# File Author / Maintainer
MAINTAINER ANO "Digital Country"

EXPOSE 80

RUN set -ex \
  && apk update \
  && apk --no-cache add \
    apk-tools

# For rc-service:
# apk add openrc

# For debug:
# apk add tcpdump bash gawk sed grep bc coreutils netcat-openbsd

RUN mkdir -p /run/nginx
RUN mkdir -p /app
RUN mkdir -p /cache

RUN chown nginx:nginx -R /app/
RUN chown nginx:nginx -R /cache/

VOLUME /app/
VOLUME /cache/

RUN apk --no-cache add \
            php7-fpm php7-mcrypt php7-soap php7-redis php7-openssl \
            php7-json php7-dom php7-zip php7-bcmath php7-gd \
            php7-xmlreader php7-xmlrpc php7-curl \
            php7-session php7-sodium php7-ldap \
            php7-pdo php7-pgsql php7-pdo_pgsql \
            php7-tokenizer composer \
            php7-ctype php7-xmlwriter \
            unzip zip \
            tzdata git

RUN mkdir -pv /var/data/static/
RUN chown nginx:nginx -R /var/data/
VOLUME /var/data/static/

ADD etc/php-fpm/www.conf /etc/php7/php-fpm.d/www.conf
ADD etc/php-fpm/php.ini /etc/php7/php.ini
ADD etc/nginx/default.conf /etc/nginx/conf.d/default.conf
ADD etc/nginx/fastcgi.conf /etc/nginx/fastcgi.conf

ADD ./docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#RUN rc-update add nginx default
#RUN rc-update add php-fpm default

ENTRYPOINT ["sh","/entrypoint.sh"]
