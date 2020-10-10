#!/bin/bash

# vars passed by app.py
ROOM_TYPE=$1
UUID=$2
DOMAIN=$3

# generate cert for sub domain
certbot certonly --webroot -w /var/www/html -m all@200013.net --agree-tos -n -d ${UUID}.${DOMAIN}

#create the room fodler
mkdir /var/www/${DOMAIN}/app/rooms/${UUID}

#create ngnix config for public room
if [[ "$ROOM_TYPE" == "public" ]];then

cat <<EOF > /etc/nginx/sites-available/${UUID}.${DOMAIN}
    server {
    listen 443 ssl;
    root /var/www/${DOMAIN}/html/rooms/${UUID};
    index chat.html;
    server_name ${UUID}.${DOMAIN};
    ssl_certificate /etc/letsencrypt/live/${UUID}.${DOMAIN}/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/${UUID}.${DOMAIN}/privkey.pem;
    location /
        {
        index chat.html;
        }
    }
EOF
fi

#create ngnix config for public room
if [[ "$ROOM_TYPE" == "private" ]];then

cat <<EOF > /etc/nginx/sites-available/${UUID}.${DOMAIN}
    server {
    listen 443 ssl;
    root /var/www/${DOMAIN}/html/rooms/${UUID};
    index chat.html;
    server_name ${UUID}.${DOMAIN};
    ssl_certificate /etc/letsencrypt/live/${UUID}.${DOMAIN}/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/${UUID}.${DOMAIN}/privkey.pem;
    location /
        {
        index chat.html;
        auth_basic "Restricted Content";
        auth_basic_user_file /var/www/${DOMAIN}/html/rooms/${UUID}/.htpasswd;
        }
    }
EOF
fi



#copy templates to room
mkdir -p /var/www/${DOMAIN}/app/rooms/${UUID}/files
cp -rvp /home/app/templates/* /var/www/${DOMAIN}/app/rooms/${UUID}/
touch /var/www/${DOMAIN}/app/rooms/${UUID}/conversation.txt
chmod 0640 /var/www/${DOMAIN}/app/rooms/${UUID}/conversation.txt
chown -R app:www-data /var/www/${DOMAIN}/app/rooms/${UUID}
chmod 0750 /var/www/${DOMAIN}/app/rooms/${UUID}/files
chmod 0440 /var/www/${DOMAIN}/app/rooms/${UUID}/js/*
chmod 0440 /var/www/${DOMAIN}/app/rooms/${UUID}/css/*
chmod 0440 /var/www/${DOMAIN}/app/rooms/${UUID}/chat.html
chmod 0640 /var/www/${DOMAIN}/app/rooms/${UUID}/conversation.txt

#if room private, copy the password file
if [[ "$ROOM_TYPE" == "private" ]];then
mv /var/www/${DOMAIN}/app/passwds/${UUID}.htpasswd /var/www/${DOMAIN}/app/rooms/${UUID}/.htpasswd
fi


#symlink nginx sites-available to sites-enabled & restart nginx
ln -s /etc/nginx/sites-available/${UUID}.${DOMAIN} /etc/nginx/sites-enabled/${UUID}.${DOMAIN}
systemctl reload nginx


