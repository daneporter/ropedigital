#!/bin/bash
# Setup WP Envrionment after initial setup

app_name=$1
usr_name=$2

# Move to target WP directory and create mu-plugins directoy and download management plugin
cd /srv/users/$usr_name/apps/$app_name/public/wp-content/
mkdir mu-plugins
cd mu-plugins
wget https://raw.githubusercontent.com/daneporter/ropedigital/master/readypress-manager.php

# Download standard htaccess file - Contains appropriate permalink config, browser caching and basic config for Apache hosts
cd /srv/users/$usr_name/apps/$app_name/public/
wget https://raw.githubusercontent.com/daneporter/ropedigital/master/.htaccess

# Download verification link. - This is a static HTML file which is used to confirm the DNS is correctly configured. 
cd /srv/users/$usr_name/apps/$app_name/public/
wget https://raw.githubusercontent.com/daneporter/ropedigital/master/verify.html


echo done
exit
