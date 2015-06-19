#!/bin/bash

# Update CentOS with any patches, excluding the kernel
yum update -y --exclude=kernel

# Install some tools
yum install -y nano git unzip screen

# Install and configure Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# Install PHP
yum install -y php php-cli php-common php-devel php-mysql

# Install MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start
mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/info.php

# Restart Apache
service httpd restart