#!/usr/bin/env sh
set -eu
eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

#Have to figure out how to tell if no migrations
#cd /var/www/html && bin/console doctrine:migrations:migrate --no-interaction

cd /var/www/html
chown -R www-data:www-data .

exec "$@"
