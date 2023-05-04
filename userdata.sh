#!/bin/bash

# Update package list and install Apache, PHP, and MySQL
sudo apt-get update
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql mysql-server

# Download and install Mediawiki
cd /var/www/html
sudo wget https://releases.wikimedia.org/mediawiki/1.36/mediawiki-1.36.0.tar.gz
sudo tar -xzf mediawiki-1.36.0.tar.gz
sudo mv mediawiki-1.36.0/ mediawiki
sudo chown -R www-data:www-data mediawiki/
sudo rm mediawiki-1.36.0.tar.gz

# Create a MySQL database and user for Mediawiki
sudo apt install mysql-server
sudo systemctl start mysql.service
sudo mysql -u root -e "CREATE DATABASE mediawiki;"
sudo mysql -u root -e "CREATE USER 'mediawikiuser'@'localhost' IDENTIFIED BY 'Shreya@2698';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON mediawiki.* TO 'mediawikiuser'@'localhost';"
systemctl status mysql.service
# Restart Apache server
sudo systemctl restart apache2