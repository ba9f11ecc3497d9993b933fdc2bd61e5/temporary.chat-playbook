#!/bin/bash

for room in $(ls /var/www/temporary.chat/app/rooms/);do
  /usr/bin/rm -v -rf /var/www/temporary.chat/app/rooms/$room
done

for site in $(ls /etc/nginx/sites-enabled/ | egrep "*.temporary.chat");do
  /usr/bin/rm -v -f /etc/nginx/sites-enabled/$site
done

/usr/bin/systemctl reload nginx
