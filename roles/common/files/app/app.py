#import the Flask class, request, and response
from flask import Flask
from flask import request 
from flask import make_response 

#import module uuid to create user & rooms
import uuid
import random
import string

#import os to create directories
import os

#import html to sanitize user input
import html

#import passlib apache for .htaccess files
from passlib.apache import HtpasswdFile

#create an instance of this class
app = Flask(__name__)


@app.route("/app/create_private")
def create_private():
    letters = string.ascii_letters
    digits = string.digits
    chars = letters + digits
    user = "".join(random.choices(chars, k=20))
    passwd = "".join(random.choices(chars, k=30))
    the_uuid = str(uuid.uuid4())
    url = "https://" + the_uuid + ".temporary.chat"
    server_name = the_uuid + ".temporary.chat"
    site_file = "./sites/" + the_uuid + ".temporary.chat"
    file = open(site_file, "w")
    file.write("server {\n  listen 443 ssl;\n  root /var/www/temporary.chat/html/rooms/" + the_uuid + ";\n  index chat.html;\n  server_name " + server_name +";\n  ssl_certificate /etc/letsencrypt/live/temporary.chat/fullchain.pem;\n  ssl_certificate_key /etc/letsencrypt/live/temporary.chat/privkey.pem;\n  location / {\n    index chat.html;\n    auth_basic \"Restricted Content\";\n    auth_basic_user_file /var/www/temporary.chat/html/rooms/" + the_uuid + "/.htpasswd;\n  }\n }\n")
    file.close
    password_file_path = "./passwds/" + the_uuid + ".htpasswd"
    ht = HtpasswdFile(password_file_path, new=True, default_scheme="bcrypt")
    ht.set_password(user, passwd)
    ht.save()
    os.mkdir("rooms/" + the_uuid)
    return "<h6>User : " + user + "</h6><br>" + "<h6>Password : " + passwd + "</h6><br>" + "<h6>URL : " + url + "</h6><br>" + "<h6>Direct link : <a href=\"" + url + "\">" + url + "</h6>"


@app.route("/app/create_public")
def create_public():
    letters = string.ascii_letters
    digits = string.digits
    chars = letters + digits
    the_uuid = str(uuid.uuid4())
    url = "https://" + the_uuid + ".temporary.chat"
    server_name = the_uuid + ".temporary.chat"
    site_file = "./sites/" + the_uuid + ".temporary.chat"
    file = open(site_file, "w")
    file.write("server {\n  listen 443 ssl;\n  root /var/www/temporary.chat/html/rooms/" + the_uuid + ";\n  index chat.html;\n  server_name " + server_name +";\n  ssl_certificate /etc/letsencrypt/live/temporary.chat/fullchain.pem;\n  ssl_certificate_key /etc/letsencrypt/live/temporary.chat/privkey.pem;\n  location / {\n    index chat.html;\n  }\n }\n")
    file.close
    os.mkdir("rooms/" + the_uuid)
    return "<h6>URL : " + url + "</h6><br>" + "<h6>Direct link : <a href=\"" + url + "\">" + url + "</h6>"


@app.route("/app/post", methods=['GET', 'POST'])
def post():
    print(request.form)
    client_message = request.form['message']
    user_name = request.form['user_name']
    client_ip = request.environ.get('HTTP_X_REAL_IP', request.remote_addr)
    referer = request.referrer
    print(client_ip + ':' + client_message)
    room = referer.replace("https://","").replace(".temporary.chat","").replace("/","")
    path_to_room = '/var/www/temporary.chat/app/rooms/' + room + '/conversation.txt'
    client_message = html.escape(client_message)
    user_name = html.escape(user_name)
    formatted_message = user_name + ' : ' + client_message + '<br>'
    file = open(path_to_room, "a")
    file.write(formatted_message)
    file.close
    res = make_response("OK")
    return res
    #return '', 200

@app.route("/app/quit", methods=['GET', 'POST'])
def quit():
  print(request.form)
  user_name = request.form['user_name']
  user_name = html.escape(user_name)
  referer = request.referrer
  room = referer.replace("https://","").replace(".temporary.chat","").replace("/","")
  path_to_room = '/var/www/temporary.chat/app/rooms/' + room + '/conversation.txt'
  formatted_message = '=> ' + user_name + ' has quit the room' + '\n'
  print(formatted_message)
  file = open(path_to_room, "a")
  file.write(formatted_message)
  file.close
  res = make_response("OK")
  return res


@app.route("/app/destroy", methods=['GET', 'POST'])
def destroy():
  print(request.form)
  user_name = request.form['user_name']
  user_name = html.escape(user_name)
  referer = request.referrer
  room = referer.replace("https://","").replace(".temporary.chat","").replace("/","")
  path_to_room = '/var/www/temporary.chat/app/rooms/' + room + '/conversation.txt'
  path_to_destroy = '/var/www/temporary.chat/app/rooms/' + room + '/destroy'
  formatted_message = '=> ' + user_name + ' has requested the destruction of this room' + '\n'
  print(formatted_message)
  file = open(path_to_room, "a")
  file.write(formatted_message)
  file.close
  file = open(path_to_destroy, "w")
  file.write("true")
  file.close
  res = make_response("OK")
  return res


@app.route("/app/upload", methods=['GET', 'POST'])
def upload():
  file_data = request.files['file']
  print(file_data)
  user_name = request.form['user_name']
  user_name = html.escape(user_name)
  referer = request.referrer
  room = referer.replace("https://","").replace(".temporary.chat","").replace("/","")
  path_to_room = '/var/www/temporary.chat/app/rooms/' + room + '/conversation.txt'
  path_to_file = '/var/www/temporary.chat/app/rooms/' + room + '/files/' + file_data.filename
  public_path_to_file = 'https://' + room + '.temporary.chat/files/' + file_data.filename
  print(path_to_file)
  print(public_path_to_file)
  file_data.save(path_to_file)
  formatted_message = '=> ' + user_name + ' have uploaded a file : ' + '<a href="' + public_path_to_file + '">' + file_data.filename + '</a>\n'
  print(formatted_message)
  file = open(path_to_room, "a")
  file.write(formatted_message)
  file.close
  res = make_response("OK")
  return res
