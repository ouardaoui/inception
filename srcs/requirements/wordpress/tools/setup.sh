#!/bin/bash

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

wp core download --allow-root
wp config create --dbname=${DBNAME} --dbuser=${NAMEADMIN} --dbpass=${PASSADMIN} --dbhost=mariadb --allow-root
wp core install --url=localhost --title="DALI3" --admin_user=${USR} --admin_password=${PASS} --admin_email=${MAIL} --allow-root

wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root

mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F
