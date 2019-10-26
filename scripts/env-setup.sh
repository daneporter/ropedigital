#!/bin/bash
# Setup WP Envrionment after initial setup

app_name=$1
usr_name=$2


cd /srv/users/$usr_name/apps/$app_name/public/wp-content/
mkdir mu-plugins
cd mu-plugins
wget https://raw.githubusercontent.com/daneporter/ropedigital/master/ropedigital-manager.php

cd /srv/users/$usr_name/apps/$app_name/public/
wget https://raw.githubusercontent.com/daneporter/ropedigital/master/.htaccess


echo done
exit
