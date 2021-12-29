#!/bin/sh

chown nginx:nginx -R /app/

php-fpm7 -F &
nginx -g "daemon off;"

#rc-service php-fpm7 start
#rc-service nginx start
