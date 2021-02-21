[Screenshots](https://imgur.com/a/vhiiy8j)

# deploy_chat.yaml
### Overview : 
an ansible playbook to deploy a chat server on an ubuntu server (see CONTRIBUTING for the vision of the project & the road map).
- works with or without a domain name
- can create a single room or multiples (random) rooms 
- you can create password protected rooms
- anyone within the room can destroy it with a single click
### requirements : 
- having ansible installed 
- having an *empty* ubuntu server 20.04 LTS with ssh access as a target for the deployment (not responsible of damages if you run this on a server with stuff on it already)
  - having a user named ubuntu on the server that is allow to sudo without a password
  - having an ssh config the the target server : 
    - e.g on ip: `host 3.87.87.87
hostname 3.87.87.87 
user ubuntu
IdentityFile /home/user/.ssh/privatekey_rsa`
    - e.g on fqdn or subdomain `host subdomain.domain.com
hostname subdomain.domain.com
user ubuntu
IdentityFile /home/luciano/.ssh/temporarychat_rsa
`
- having port 22,80 and 443 open on the server firewall
### rooms options :
- `multirooms:true` : will create a webpage where you can create random chatrooms (like temporary.chat)
- `multirooms:false` : will create a webpage where you can create a single chatroom
### tls options :
I wanted to abstract this totally from the user but it is not possible due to [let's encrypt rate limit](https://letsencrypt.org/docs/rate-limits/)
- `wildcard` : run this mode if you want to run a multi room setup able to create more than 50 chatrooms per week (will use let's encrypt)
  - requires a fully qualified domain name e.g : example.com
  - requires an interaction during the deployment
    - you will need to add a TXT entry in your dns records ( the playbook will give you this information while running )
- `normal` : run this mode if you intend to create a single chatroom or less than 50 chatrooms per week (will use let's encrypt)
  - when used with multirooms:true
    - requires a fully qualified domain name e.g : example.com
    - requires no interaction during deployment
  - when used with multirooms: false
    - you may be able to use a dynamic dns if it is in the [Mozilla Public Suffix List](https://github.com/publicsuffix/list/blob/master/public_suffix_list.dat) and let's encrypt support it  
- `pki` : run this mode if you don't have a fully qualified domain 
  - does not require anything
  - will automatically create a self sign certificate 
  - will create a helper webpage to help you download/install the certificate 
    - the fingerprint of the certificate will be displayed on the helper webpage

## deployment examples :
### deploy with a fully qualified domain name that you own in multirooms mode 
##### usage example :
`ansible-playbook -i inventory -l staging -e '{"have_fqdn":true}' -e '{"multirooms":true}' -e "my_fqdn=temporary.chat" -e "tls_mode=wildcard" -e "le_mailaddress=all@200013.net" deploy_chat.yaml`

or

`FQDN=example.com;ansible-playbook -i ${FQDN},  -e '{"have_fqdn":true}' -e '{"multirooms":true}' -e "my_fqdn=$FQDN" -e "tls_mode=normal" -e "le_mailaddress=myemail@example.com" deploy_chat.yaml`
### deploy with a fully qualified domain or subdomain name that you own (single room)
##### usage example : 
`FQDN=chat.example.com;ansible-playbook -i ${FQDN}, -e '{"have_fqdn":true}' -e '{"multirooms":false}' -e "my_fqdn=$FQDN" -e "tls_mode=normal" -e "le_mailaddress=all@200013.net" deploy_chat.yaml`
(go to https://chat.example.com/launcher) to create your room once the deployment is done
### deploy *without* a fully qualified domain name (single room accessible via ip)
##### usage example : 
`ansible-playbook -i inventory -l qa -e '{"have_fqdn":false}' -e '{"multirooms":false}' -e "my_fqdn=95.179.185.213" -e "tls_mode=pki" deploy_chat.yaml`


### the roadmap (oh god!)

see CONTRIBUTING.md
