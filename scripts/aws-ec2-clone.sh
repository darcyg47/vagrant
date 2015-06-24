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

# Install MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Enable Remi repo
cd /etc/yum.repos.d
wget http://rpms.remirepo.net/enterprise/remi.repo

#install phpMyAdmin
yum --enablerepo=remi install phpMyAdmin

# Update PHP to 5.5
yum --enablerepo=remi-php55,remi -y update php\*

service httpd restart

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/info.php