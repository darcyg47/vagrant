#!/bin/bash 

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