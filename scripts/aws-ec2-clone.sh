#!/bin/bash

# Update CentOS with any patches, excluding the kernel
yum update -y --exclude=kernel

# Install some tools
yum install -y nano git unzip screen nc telnet

# Install and configure Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

# Remove Apache's default server directory and replace it with a symbolic link
# to /vagrant which is shared between host and guest via guest additions
rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# Install PHP
yum install -y php php-cli php-common php-devel php-mysql

# Include additional repos (required for updates)
wget -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
wget -q http://rpms.remirepo.net/enterprise/remi-release-6.rpm
wget -q localinstall http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
rpm -Uvh remi-release-6*.rpm epel-release-*.rpm mysql-community-release-*.rpm

# Install MySQL
yum install mysql-community-server
#yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start

# Install phpMyAdmin
yum install -y phpMyAdmin

# Update PHP and MySQL
yum --enablerepo=remi-php55,remi -y update php\*
#yum --enablerepo=remi -y update mysql-server

# Delete the phpMyAdmin config file and replace it with one that will allow
# access from the host machine
cd /etc/httpd/conf.d/
sudo rm -f phpMyAdmin.conf
sudo wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/phpMyAdmin.conf

# Replace the httpd config file to allow modrewrite
cd /etc/httpd/conf/
sudo rm -f httpd.conf
sudo wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/httpd.conf

# Restart services
service mysqld restart
service httpd restart

# Set password for root user in phpMyAdmin
mysql -u root -e "SET PASSWORD FOR root@localhost = PASSWORD('password');"

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/info.php
