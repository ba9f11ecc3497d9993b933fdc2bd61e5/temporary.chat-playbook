### the vision

- free/open source part:
  - offer a service easy to use, that requires no inscription/login (execpt the automatically generated password protected rooms) and works in a browser.
  - lower/remove the reliance on  big commercial entities (looking at you facebook/whatsapp google etc) to exchange data by making this service good enough.
  - remove the need to install specific programs/apps to communicate (should work with a browser and http protocol) 
  - offer the possibility for anyone savvy enough to roll out their own instance of this chat server with their own domain or simply an ip
  - offer the possibility for end to end encryption (managed by the user) (gpg messages via the api)
  - offer a free service that will remain free and ad free ( temporary.chat )

- possible future business/support offer:
  - offer a permanent/non-free service with more storage and custom room names ( permanent.chat )
  - help people to roll out their own instance of this chat server with their own domain eg : chat.mycompany.com

### the roadmap (oh god!)

##### UI:
- FEATURE/Icons to buttons (especially menu button) 
- FEATURE/Preview file before uploading
- FEATURE/preview url & pictures shared in the room
- FEATURE/Ping a user & Browser notifications
- FEATURE/add timestamp on messages
- FEATURE/copy url to the clipboard & invite people on room creation
##### APP:
- SECURITY/add [CSP](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
- BUG-HIGH/page no longer refresh after a while idle.
- BUG-MEDIUM/room destroy dont parse arguments correctly if username have a space in it.
- BUG-LOW/when in single room mode, destroying & recreating room too fast will cause issues (symlink of symlinks) have to dig further why 
- IMPROVEMENT/on room destroy : display message, update version (countdown?)
- IMPROVEMENT/fix request entity too large issue (nginx) think of a decent quota 
- FEATURE/make a solution to use dynamic dns + let's encrypt for single room (does this already work? need to test) 
- FEATURE/create api for expert users that want to manage their encryption
- FEATURE/support other OS (centos, openbsd to start with)
##### FAR BACKEND:
- system updates
- hostname


### Actually contributing

if you made it that far, you probably have an interest in this project.

if you want to do any of the below actions, you can contact me at <all@200013.net> and include "TEMPORARY.CHAT:FEATURE" or "TEMPORARY.CHAT:BUG" or "TEMPORARY.CHAT:INFO" in the subject line. I will implement something better if people have interest in that project (proper pull requests/issues)

How to file a bug report (try using issue and pull request templates)
How to suggest a new feature
How to set up your environment and run tests
