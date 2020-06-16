#!/bin/bash
# A simple  script

root_user=$1
usr_name=$2
app_name=$3
ip=$4


#Get latest version
wget -q https://raw.githubusercontent.com/daneporter/ropedigital/master/index.html -O ./index.html

#Copy to target
scp ./index.html $root_user@$ip:/srv/users/$usr_name/apps/$app_name/public/

echo done
