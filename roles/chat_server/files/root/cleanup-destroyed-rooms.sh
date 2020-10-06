#!/bin/bash
for room in $(ls /var/www/temporary.chat/app/rooms);do
if [ -f "/var/www/temporary.chat/app/rooms/${room}/destroyed" ];then
  rm -vrf /var/www/temporary.chat/app/rooms/${room}
  rm -vrf /etc/nginx/sites-available/${room}.temporary.chat
  rm -vrf /etc/nginx/sites-enabled/${room}.temporary.chat
  systemctl reload nginx
fi
done
