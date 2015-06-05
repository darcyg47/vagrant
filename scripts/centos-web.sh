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

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/darcyg47/vagrant/master/files/info.php