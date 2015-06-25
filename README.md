# Vagrant

You'll need to AllowOverride All in /etc/httpd/conf/httpd.conf in order to use RewriteEngine in .htaccess

Also, in order to access phpMyAdmin from your host machine, be sure to Allow it in /etc/httpd/conf.d/phpMyAdmin.conf

Restart the httpd service after having made those changes.

A sample Vagrantfile is provided.
