#!/bin/bash

read -p "enter the ip or the fully qualified domain name of your server : " FQDN_OR_IP
read -p "enter the path of your ssh private key that will be used to access the server : " PRIV_KEY

echo "#########################"
echo "#####  SSH SECTION  #####"
echo "#########################"
echo ""
echo "host $FQDN_OR_IP"
echo "hostname $FQDN_OR_IP"
echo "user ubuntu"
echo "TCPKeepAlive yes"
echo "ServerAliveInterval 50"
echo "IdentityFile $PRIV_KEY"
echo "StrictHostKeyChecking no"
echo "UserKnownHostsFile=/dev/null"
echo ""
echo "place the ^above^ lines in /home/$USER/.ssh/config"
echo ""
echo "#############################"
echo "#####  ANSIBLE SECTION  #####"
echo "#############################"
echo ""
echo "[localhost]"
echo "127.0.0.1 ansible_connection=local"
echo "[chat]"
echo "$FQDN_OR_IP ansible_ssh_private_key_file=$PRIV_KEY ansible_user=ubuntu"
echo ""
echo "place the ^above^ lines in \"inventory\" file"
echo ""




