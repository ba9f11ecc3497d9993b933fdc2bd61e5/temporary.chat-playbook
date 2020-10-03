#!/bin/bash

while true;do
  for site in $(ls /var/www/temporary.chat/app/sites);do
    UUID=$(echo $site | cut -d "." -f 1)
    mv /var/www/temporary.chat/app/sites/$site /etc/nginx/sites-available/$site
    cp -rvp /home/app/templates/* /var/www/temporary.chat/app/rooms/$UUID/
    touch /var/www/temporary.chat/app/rooms/$UUID/conversation.txt
    mkdir /var/www/temporary.chat/app/rooms/$UUID/files
    chown www-data:app /var/www/temporary.chat/app/rooms/$UUID/files
    chmod g+rw /var/www/temporary.chat/app/rooms/$UUID/files
    chmod u+rw /var/www/temporary.chat/app/rooms/$UUID/files
    chmod o+rw /var/www/temporary.chat/app/rooms/$UUID/files
    chown -R www-data:app /var/www/temporary.chat/app/rooms/$UUID/*
    chmod g+rw /var/www/temporary.chat/app/rooms/$UUID/conversation.txt
    chmod u+rw /var/www/temporary.chat/app/rooms/$UUID/conversation.txt
    chmod o+w /var/www/temporary.chat/app/rooms/$UUID/conversation.txt
    chmod g+w /var/www/temporary.chat/app/rooms/$UUID
    chmod u+w /var/www/temporary.chat/app/rooms/$UUID
    ln -s /etc/nginx/sites-available/$site /etc/nginx/sites-enabled/$site
    systemctl reload nginx
  done
  for passwd in $(ls /var/www/temporary.chat/app/passwds);do
    UUID=$(echo $passwd | cut -d "." -f 1)
    mv /var/www/temporary.chat/app/passwds/${UUID}\.htpasswd /var/www/temporary.chat/app/rooms/$UUID/\.htpasswd
    systemctl reload nginx
  done
  for room in $(ls /var/www/temporary.chat/app/rooms);do
  if [ -f "/var/www/temporary.chat/app/rooms/${room}/destroy" ];then
    echo '<html><body><h1>This room was destroyed</h1></body></html>' > /var/www/temporary.chat/app/rooms/${room}/chat.html
    rm -vrf /var/www/temporary.chat/app/rooms/${room}/js
    rm -vrf /var/www/temporary.chat/app/rooms/${room}/css
    rm -vrf /var/www/temporary.chat/app/rooms/${room}/conversation.txt
    touch /var/www/temporary.chat/app/rooms/${room}/destroyed
  fi
  done
  sleep 1    
done 
