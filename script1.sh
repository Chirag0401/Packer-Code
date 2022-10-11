#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo apt install mysql-server -y
sudo apt install php-fpm php-mysql -y
sudo apt install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
cd /var/www/
sudo curl -LO https://wordpress.org/latest.tar.gz
sudo tar xzvf latest.tar.gz
cd /var/www/wordpress
sudo cp wp-config-sample.php wp-config.php
cd ..
sudo chown -R www-data:www-data /var/www/wordpress
sudo rm /var/www/latest.tar.gz
