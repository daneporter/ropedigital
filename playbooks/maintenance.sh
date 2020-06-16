#!/bin/bash
# A simple  script

app_name=$1
usr_name=$2
template_id=$3
usr_email=$4
sub_domain=$5



#Enter Maintenance Mode
#sudo -u $usr_name -i -- wp maintenance-mode activate --path=/srv/users/$usr_name/apps/$app_name/public/
#New line wget https://raw.githubusercontent.com/daneporter/ropedigital/master/index.html
wget -q https://raw.githubusercontent.com/daneporter/ropedigital/master/index.html -O /srv/users/$usr_name/apps/$app_name/public/index.html

rm /srv/users/$usr_name/apps/$app_name/public/index.html
echo done
