#!/bin/bash
# Create WP Admin User Account

app_name=$1
usr_name=$2
usr_email=$3
usr_pass=$4
site_name=$5



sudo -u $usr_name -i -- wp user create $usr_email $usr_email --user_pass=$usr_pass --role=administrator  --path=/srv/users/$usr_name/apps/$app_name/public/
#Update Timezone to Melbourne
sudo -u $usr_name -i -- wp option update timezone_string "Australia/Melbourne" --path=/srv/users/$usr_name/apps/$app_name/public/
#Update Site / Blog name
sudo -u $usr_name -i -- wp option update blogname "$site_name" --path=/srv/users/$usr_name/apps/$app_name/public/

echo done
exit
