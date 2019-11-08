#!/bin/bash
apt install git vim nginx

#install postgres
apt install postgresql postgresql-contrib

#install mysql
apt install mysql-server

#install mongodb
apt install -y mongodb

#install nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

#update npm
sudo npm install npm@latest -g

#install create-react-app
npm install -g create-react-app

#configin file with default configurations
cd /etc/nginx/conf.d
touch khristichmihail.conf
cat <<EOF >khristichmihail.conf
  server {
    listen       80;
    server_name  khristichmihail.best www.khristichmihail.best;
    access_log   /home/my-home-server/logs/access.log;
    root         /home/my-home-server;

    location / {
      proxy_pass   http://0.0.0.0:3000;
    }
  }
EOF
