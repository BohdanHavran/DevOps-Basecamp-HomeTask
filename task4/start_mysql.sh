#!/bin/bash
sudo apt-get -y update
sudo apt -y install mysql-client mysql-server
sudo mysql -u root -proot << eof
CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'wordpressuser'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL ON wordpress.* TO 'wordpressuser'@'%';
FLUSH PRIVILEGES;
eof
sudo ufw allow 3306
sudo chmod -R 777 /etc/mysql
sudo echo "[mysqld]
bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
sudo service mysql restart
