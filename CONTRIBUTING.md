### the vision

- free/open source part:
  - offer a service easy to use, that requires no inscription/login (execpt the automatically generated password protected rooms) and works in a browser.
  - lower/remove the reliance on  big commercial entities to exchange data by making this service good enough (looking at you facebook/whatsapp google etc)
  - remove the need to install specific programs/apps to communicate (should work with a browser and http protocol) 
  - offer the possibility for anyone savvy enough to roll out their own instance of this chat server with their own domain or simply an ip
  - offer the possibility for end to end encryption (managed by the user) (gpg messages via the api)
  - offer a free service that will remain free and ad free ( temporary.chat )

- possible business/support offer:
  - offer a permanent/non-free service with more storage and custom room names ( permanent.chat )
  - help people to roll out their own instance of this chat server with their own domain eg : chat.mycompany.com


### the roadmap (oh god!)

##### UI:
- IMPROVEMENT/refreshing div constantly is resource expensive, try to think of a better way
  - https://www.shanelynn.ie/asynchronous-updates-to-a-webpage-with-flask-and-socket-io/ (need to read this after I get some sleep)
- IMPROVEMENT/cant select text because of constant div refresh
- FEATURE/add .ico
- FEATURE/Icons to buttons (especially menu button) 
- FEATURE/Each row in the conversation should be wrapped in an element (not using br) and styled
- FEATURE/Preview file before uploading
- FEATURE/preview url & pictures shared in the room
- FEATURE/Ping a user & Browser notifications
- FEATURE/add timestamp on messages
##### APP:
- SECURITY/add [HSTS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security)
- SECURITY/add [CSP](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
- SECURITY/create an http -> https redirect when ran in multirooms mode 
- IMPROVEMENT/fix request entity too large issue (nginx) think of a decent quota 
- FEATURE/make a solution to use dynamic dns + let's encrypt for single room 
- FEATURE/create api for expert users that want to manage their encryption
- FEATURE/support other OS (centos, openbsd to start with)
##### FAR BACKEND:
- system updates
- hostname

