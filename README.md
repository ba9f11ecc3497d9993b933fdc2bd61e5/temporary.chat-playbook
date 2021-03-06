[Screenshot1](https://user-images.githubusercontent.com/70525822/108941864-d4241700-7623-11eb-9d6e-c8ccd8af5689.png)

[Screenshot2](https://user-images.githubusercontent.com/70525822/108941906-ec943180-7623-11eb-8a50-f2f232cb80a0.png)

[Screenshot3](https://user-images.githubusercontent.com/70525822/108942231-9e336280-7624-11eb-83e5-234e48424c61.png)

[Screenshot4](https://user-images.githubusercontent.com/70525822/108942290-b905d700-7624-11eb-86a9-32fe4de12c38.png)

[Screenshot5](https://user-images.githubusercontent.com/70525822/108942390-e81c4880-7624-11eb-9500-6015d0625524.png)

[Screenshot6](https://user-images.githubusercontent.com/70525822/108942396-eb173900-7624-11eb-8af7-74788d77e34d.png)


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
  - having a user named ubuntu on the server that is allow to sudo without a password (will change this to a variable)
  - having port `22`,`80` and `443` open on the server firewall
  - having an ssh config the the target server (use the `config_helper.sh` script to generate both your ssh config and your ansible config)
### rooms options :
- `multirooms:true` : will create a webpage where you can create random chatrooms (like temporary.chat)
- `multirooms:false` : will create a webpage where you can create a single chatroom
### tls options :
I wanted to abstract this totally from the user but it is not possible due to [let's encrypt rate limit](https://letsencrypt.org/docs/rate-limits/)
- `wildcard` : run this mode if you want to run a multi room setup able to create more than 50 chatrooms per week (will use let's encrypt)
  - requires a fully qualified domain name e.g : example.com
  - requires an interaction during the deployment
    - you will need to add a TXT entry in your dns records (the playbook will give you this information while running)
- `normal` : run this mode if you intend to create 50 chatrooms per week maximum (will use let's encrypt)
  - when used with `multirooms:true`
    - requires a fully qualified domain name e.g : example.com
    - requires no interaction during deployment
    - rooms takes a bit longer to create (one certificate is issued per room)
  - when used with `multirooms:false`
    - you can use this to create a single chatroom with dynamic dns or with your fully qualified domain name.
- `pki` : run this mode if you don't have a fully qualified domain 
  - does not require anything
  - will automatically create a self sign certificate 
  - will create a helper webpage to help you download/install the certificate 
    - the fingerprint of the certificate will be displayed on the helper webpage

## deployment examples :
### deploy with a fully qualified domain name that you own in multirooms mode 
##### usage example :
`ansible-playbook -i inventory -l chat -e '{"have_fqdn":true}' -e '{"multirooms":true}' -e "my_fqdn=temporary.chat" -e "tls_mode=wildcard" -e "le_mailaddress=all@200013.net" deploy_chat.yaml`

or

`ansible-playbook -i inventory -l chat -e '{"have_fqdn":true}' -e '{"multirooms":true}' -e "my_fqdn=temporary.chat" -e "tls_mode=normal" -e "le_mailaddress=all@200013.net" deploy_chat.yaml`
### deploy with a fully qualified domain or subdomain name that you own (single room)
##### usage example : 
`ansible-playbook -i inventory -l chat  -e '{"have_fqdn":true}' -e '{"multirooms":false}' -e "my_fqdn_=poubelle.cc" -e "tls_mode=normal" -e "le_mailaddress=all@200013.net" deploy_chat.yaml`

### deploy *without* a fully qualified domain name (single room accessible via ip)
##### usage example : 
`ansible-playbook -i inventory -l chat -e '{"have_fqdn":false}' -e '{"multirooms":false}' -e "my_fqdn=95.179.185.213" -e "tls_mode=pki" deploy_chat.yaml`


### the roadmap (oh god!)

see CONTRIBUTING.md
