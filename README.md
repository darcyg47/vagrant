# Vagrant

A sample Vagrantfile is provided.

## EC2 Clone 
- PHP 5.5.26
  - Including extensions:
    - memcached
- MySql 5.6.22
  - Default credentials:
    -root@localhost : password
- phpMyAdmin 4.4.10
- modifies config files to:
  - allow use of RewriteEngine
  - allow access to phpMyAdmin from the host machine
  - remove STRICT_TRANS_TABLES from mySql
  - turned EnableSendfile off to try to fix the Vagrant update issue 

