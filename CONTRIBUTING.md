### the vision

- free/open source part:
  - offer a service easy to use, that requires no inscription/login (execpt the automatically generated password protected rooms) and works in a browser.
  - lower/remove the reliance on  big commercial entities (looking at you facebook/whatsapp google etc) to exchange data (text messages & various document (voice messages?)) by making this service good enough.
  - remove the need to install specific programs/apps to communicate (should work with a browser and http protocol) 
  - offer the possibility for anyone savvy enough to roll out their own instance of this chat server with their own domain or simply an ip
  - offer the possibility for end to end encryption (managed by the user) (gpg messages via an api)
  - offer a free service that will remain free and ad free ( temporary.chat )

- possible future business/support offer:
  - offer a permanent/non-free service with more storage and custom room names ( permanent.chat )
  - help people to roll out their own instance of this chat server with their own domain eg : chat.mycompany.com

### the roadmap (oh god!)

##### UI:
- FEATURE/Ping a user & Browser notifications
- FEATURE/Create CLI interface /nick [username] /ping [username] /upload (will open your file browser of choice)
- FEATURE/detect common file types and put pretty icons on preview (mp3 = music note icon, pdf = document icon etc)
- FEATURE/preview url 
- FEATURE/add timestamp on messags
- FEATURE/copy url to the clipboard & invite people on room creation
- UX_IMPROVEMENTS/and also, using skeuomorphic iconography these days is a pretty difficult thing to do right. I would absolutely wholeheartedly recommend switching all your icons/images to use a single cohesive "iconfont", such as FontAwesome
- 
##### APP:
- SECURITY/find a way to prevent javascript or html upload (rename the files?)
- SECURITY/add new-ish header Permissions-Policy https://www.w3.org/TR/permissions-policy-1/
- FEATURE/make a solution to use dynamic dns + let's encrypt for single room (does this already work? need to test) 
- FEATURE/create api for expert users that want to manage their encryption
- FEATURE/support other OS (centos, openbsd to start with)
- SPECIFIC/implement uploading images from temporary.chat to https://projectarachnid.ca/en/ api when domain is temporary.chat and think of a disclaimer
- CODE_IMPROVEMENTS/parse invalid chars in create_room.sh & destroy_room.sh with "read -r -d "" -n 1 and $REPLY" instead
- CODE_IMPROVEMENTS/dont use shell=True in app.py (will have to catch the result of cmd = ['/some/prog', first_arg, second_arg]; subprocess.run(..)
##### FAR BACKEND & DEPLOYMENT:
- make a "how to" guide on how to deploy on virtualbox or kvm
- system updates
- hostname


### Actually contributing

if you made it that far, you probably have an interest in this project.

if you want to do any of the below actions, you can contact me at <all@200013.net> and include "TEMPORARY.CHAT:FEATURE" or "TEMPORARY.CHAT:BUG" or "TEMPORARY.CHAT:INFO" in the subject line. I will implement something better if people have interest in that project (proper pull requests/issues)

How to file a bug report (try using issue and pull request templates)
How to suggest a new feature
How to set up your environment and run tests
