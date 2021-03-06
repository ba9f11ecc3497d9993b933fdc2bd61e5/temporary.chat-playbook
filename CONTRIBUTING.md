### the vision

- free/open source part:
  - offer a service easy to use, that requires no inscription/login (execpt the automatically generated password protected rooms) and works in a browser.
  - lower/remove the reliance on  big commercial entities (looking at you facebook/whatsapp google etc) to exchange data (text messages & various document (voice messages?)) by making this service good enough.
  - remove the need to install specific programs/apps to communicate (should work with major browsers and https protocol) 
  - offer the possibility for anyone savvy enough to roll out their own instance of this chat server with their own domain, dynamic dns or simply an ip
  - offer the possibility for end to end encryption (managed by the user) (gpg messages via an api)
  - offer a free service that will remain free, tracker free and advertising free ( temporary.chat )

- possible future business/support offer:
  - offer a permanent/non-free service with more storage and custom room names ( permanent.chat )
  - help people to roll out their own instance of this chat server with their own domain eg : chat.mycompany.com

### the roadmap (oh god!)

##### UI:
- FEATURE/add timestamp on messages
- UX/IMPROVEMENT I clicked the destroy room button twice and it started two counters.
- UX/IMPROVEMENT why/updates/q&a/content pages don't have a defined width. add  max-width: 100% add line-height as well
- FEATURE/preview url
- FEATURE/copy url to clipboard & invite people on room creation
- UX_IMPROVEMENTS/all rss feed in the room should be replaced with a new file with destruction message on destroy
- UX_IMPROVEMENTS/using skeuomorphic iconography these days is a pretty difficult thing to do right. I would absolutely wholeheartedly recommend switching all your icons/images to use a single cohesive "iconfont", such as FontAwesome
- 
##### APP:
- FEATURE/Create Named rooms (remove the uuid check and restrict the create rooms api endpoints.) New subdomain will be encrypted, neat (room familly.example.com, room friends.exmple.com)
- FEATURE/create api for expert users that want to manage their encryption
- FEATURE/support other OS (centos, openbsd to start with; check nixos)
- CODE_IMPROVEMENTS/template room_bot version
- CODE_IMPROVEMENTS/parse invalid chars in create_room.sh & destroy_room.sh with "read -r -d "" -n 1 and $REPLY" instead
- CODE_IMPROVEMENTS/dont use shell=True in app.py (will have to catch the result of cmd = ['/some/prog', first_arg, second_arg]; subprocess.run(..)
- CODE_IMPROVEMENTS/template ngnix.conf custom values
##### FAR BACKEND & DEPLOYMENT:
- change user `ubuntu` to be a variable instead
- make a "how to" guide on how to deploy on virtualbox or kvm
- system updates
- hostname : hard to template witout adding a variable.


### Actually contributing

if you made it that far, you probably have an interest in this project.

if you want to do any of the below actions, you can contact me at <all@200013.net> and include "TEMPORARY.CHAT:FEATURE" or "TEMPORARY.CHAT:BUG" or "TEMPORARY.CHAT:INFO" in the subject line. I will implement something better if people have interest in that project (proper pull requests/issues)

How to file a bug report (try using issue and pull request templates)
How to suggest a new feature
How to set up your environment and run tests
