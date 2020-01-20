#!/bin/bash
# A simple copy script

app_name=$1
usr_name=$2

# Install Starter Site on Target WP - Sudo (Using Astra Starters)


sudo -u $usr_name -i -- wp plugin delete akismet hello --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp theme delete twentynineteen twentyseventeen twentysixteen --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp post delete $(wp post list --post_type='post' --format=ids --path=/srv/users/$usr_name/apps/$app_name/public/ --allow-root) 
sudo -u $usr_name -i -- wp post delete $(wp post list --post_type='page' --format=ids --path=/srv/users/$usr_name/apps/$app_name/public/ --allow-root)
sudo -u $usr_name -i -- wp widget delete $(wp widget list sidebar-1 --format=ids) --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option update blogdescription "WordPress Hosted by Rope Digital" --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option set default_comment_status closed --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp rewrite structure '/%postname%/' --hard --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install elementor --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/plugins/elementor-pro-2.7.2.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option update timezone_string "Australia/Melbourne" --path=/srv/users/$usr_name/apps/$app_name/public/
#sudo -u $usr_name -i -- wp theme install hello-elementor --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp theme install astra --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://ropedigital.com.au/plugins/astra-addon.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
#sudo -u $usr_name -i -- wp plugin install "https://ropedigital.com.au/plugins/powerpack-elements.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install astra-sites --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp brainstormforce license activate astra-addon f29d834f5cad15f2845fdc6bf9469875
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_AUTHOR 'Rope Digital'
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_AUTHOR 'Agency Author'
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_AUTHOR_URL 'www.your-website-url.com'
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_LICENCE 'www.your-get-licence-url.com'
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_NAME 'Fastest WP Theme'
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_DESCRIPTION 'WordPress theme'
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_SCREENSHOT 'www.your-theme-screenshot-url.com'            
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_PRO_NAME 'Pro Addon'         
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_PRO_DESCRIPTION 'Pro Addon extends the features of theme'
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_SITES_NAME 'Ready Sites'       
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_SITES_DESCRIPTION 'Library of Ready sites'
sudo -u $usr_name -i -- wp config set AST_WL_BSF_LW_SB_NAME 'Custom Sidebar Manager'      
sudo -u $usr_name -i -- wp config set AST_WL_BSF_LW_SB_DESCRIPTION 'Manage your Sidebar'    
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_HOOKS_NAME 'Hooks for theme'           
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_HOOKS_DESCRIPTION 'Use hooks to put custom code' 
sudo -u $usr_name -i -- wp config set AST_WL_BSF_CUSTOM_FONTS_NAME 'My Custom Fonts' 
sudo -u $usr_name -i -- wp config set AST_WL_BSF_CUSTOM_FONTS_DESCRIPTION 'Add custom fonts' 
sudo -u $usr_name -i -- wp config set AST_WL_CUSTOM_TYPEKIT_FONTS_NAME 'My fonts' 
sudo -u $usr_name -i -- wp config set AST_WL_CUSTOM_TYPEKIT_FONTS_DESCRIPTION 'Add custom typekit font' 



echo done
