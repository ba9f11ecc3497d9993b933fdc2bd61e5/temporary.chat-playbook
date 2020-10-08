#!/bin/bash

# vars passed by app.py
USERNAME=$1
UUID=$2
DOMAIN=$3

rm -vrf /var/www/${DOMAIN}/app/rooms/${UUID}/*
echo "<html><body><h1><div class="conversation" id="conversation">$USERNAME destroyed this room</div></h1></body></html>" > /var/www/${DOMAIN}/app/rooms/${UUID}/conversation.txt
touch /var/www/${DOMAIN}/app/rooms/${UUID}/destroyed
