#!/bin/sh

apt update
apt install -y apache2 php libapache2-mod-php php-mysql

rm /etc/apache2/sites-enabled/000-default.conf

mv /tmp/web_app_site.conf /etc/apache2/sites-available/
ln /etc/apache2/sites-available/web_app_site.conf /etc/apache2/sites-enabled/

systemctl restart apache2.service


ufw allow ssh
ufw limit http
yes | ufw enable
