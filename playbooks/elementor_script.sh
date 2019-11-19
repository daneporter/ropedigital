#!/bin/bash
# A simple copy script

app_name=$1
usr_name=$2

# Install Elementor on Target WP - Sudo 


sudo -u $usr_name -i -- wp plugin delete akismet hello --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp theme delete twentyseventeen twentysixteen --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp post delete $(wp post list --post_type='post' --format=ids --path=/srv/users/$usr_name/apps/$app_name/public/ --allow-root) --path=/srv/users/$usr_name/apps/$app_nam$
sudo -u $usr_name -i -- wp post delete $(wp post list --post_type='page' --format=ids --path=/srv/users/$usr_name/apps/$app_name/public/ --allow-root) --path=/srv/users/$usr_name/apps/$app_nam$
sudo -u $usr_name -i -- wp widget delete $(wp widget list sidebar-1 --format=ids) --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option update blogdescription "WordPress Hosted by Rope Digital" --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option set default_comment_status closed --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp rewrite structure '/%postname%/' --hard --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install elementor --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/plugins/elementor-pro-2.7.2.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option update timezone_string "Australia/Melbourne" --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp theme install astra --activate --path=/srv/users/$usr_name/apps/$app_name/public/
#sudo -u $usr_name -i -- wp plugin install "https://ropedigital.com.au/plugins/astra-addon.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
#sudo -u $usr_name -i -- wp plugin install "https://ropedigital.com.au/plugins/powerpack-elements.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install astra-sites --activate --path=/srv/users/$usr_name/apps/$app_name/public/

echo done
