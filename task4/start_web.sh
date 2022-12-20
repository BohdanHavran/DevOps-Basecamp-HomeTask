#!/bin/bash
sudo apt-get -y update
sudo apt -y install apache2
sudo apt -y install php
sudo apt -y install libapache2-mod-php
sudo apt -y install graphviz aspell ghostscript clamav php-pspell php-curl php-gd php-intl php-mysql php-xml php-xmlrpc php-ldap php-zip php-soap php-mbstring
sudo service apache2 restart
cd /tmp
curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
touch /tmp/wordpress/.htaccess
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
mkdir /tmp/wordpress/wp-content/upgrade
sudo cp -a /tmp/wordpress/. /var/www/wordpress
sudo sed -i.bak 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/wordpress/g' /etc/apache2/sites-available/000-default.conf
sudo service apache2 restart
sudo chown -R www-data:www-data /var/www/wordpress
sudo chown -R 777 /var/www/wordpress
sudo echo "$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)" >> /var/www/wordpress/wp-config.php
sudo sed -i "s/database_name_here/wordpress/g" /var/www/wordpress/wp-config.php
sudo sed -i "s/username_here/wordpressuser/g" /var/www/wordpress/wp-config.php
sudo sed -i "s/password_here/password/g" /var/www/wordpress/wp-config.php
gsutil cp gs://internalip/internalip.txt ~/
gsutil rm -r gs://internalip
sudo sed -i "s#localhost#$(cat ~/internalip.txt)#g" /var/www/wordpress/wp-config.php
