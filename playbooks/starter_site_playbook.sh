#!/bin/bash
# A simple copy script

app_name=$1
usr_name=$2
template_id=$3

# Install Starter Site on Target WP - Sudo (Using Astra Starters)

#Cleanup Default WP - Remove unwanted Themes and Plugins
sudo -u $usr_name -i -- wp plugin delete akismet hello --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp theme delete twentynineteen twentyseventeen twentysixteen --path=/srv/users/$usr_name/apps/$app_name/public/

#Cleanup Default WP - Remove unwanted Posts and Widgets
sudo -u $usr_name -i -- wp post delete $(wp post list --post_type='post' --format=ids --path=/srv/users/$usr_name/apps/$app_name/public/ --allow-root) 
sudo -u $usr_name -i -- wp post delete $(wp post list --post_type='page' --format=ids --path=/srv/users/$usr_name/apps/$app_name/public/ --allow-root)
sudo -u $usr_name -i -- wp widget delete $(wp widget list sidebar-1 --format=ids) --path=/srv/users/$usr_name/apps/$app_name/public/

#Cleanup Default WP - Update Site Name, Comments, Permalink, Datetime

sudo -u $usr_name -i -- wp option update blogdescription "WordPress Hosted by Rope Digital" --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option set default_comment_status closed --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp rewrite structure '/%postname%/' --hard --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option update timezone_string "Australia/Melbourne" --path=/srv/users/$usr_name/apps/$app_name/public/

#Install Required Theme & Plugins
sudo -u $usr_name -i -- wp theme install astra --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install elementor --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/plugins/elementor-pro-2.7.2.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/starter-sites/plugins/astra-addon-plugin.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/starter-sites/plugins/ultimate-elementor.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/starter-sites/plugins/astra-premium-sites.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/

#Activate Licence for Pro Product Sets
sudo -u $usr_name -i -- wp brainstormforce license activate astra-addon f29d834f5cad15f2845fdc6bf9469875 --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp brainstormforce license activate astra-pro-sites 8c6c089af61dac7dcde1fa27da0fe350 --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp brainstormforce license activate uael eafc56423344b436e641215255dff53a --path=/srv/users/$usr_name/apps/$app_name/public/

#Configure Astra Pro settings and set Elementor as page builder
sudo -u $usr_name -i -- wp astra-sites page_builder set elementor --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_AUTHOR 'Rope Digital' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_AUTHOR 'Agency Author' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_AUTHOR_URL 'www.your-website-url.com' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_LICENCE 'www.your-get-licence-url.com' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_NAME 'Fastest WP Theme' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_DESCRIPTION 'WordPress theme' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_SCREENSHOT 'www.your-theme-screenshot-url.com' --path=/srv/users/$usr_name/apps/$app_name/public/          
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_PRO_NAME 'Pro Addon' --path=/srv/users/$usr_name/apps/$app_name/public/      
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_PRO_DESCRIPTION 'Pro Addon extends the features of theme' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_SITES_NAME 'Ready Sites' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_SITES_DESCRIPTION 'Library of Ready sites' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_BSF_LW_SB_NAME 'Custom Sidebar Manager' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_BSF_LW_SB_DESCRIPTION 'Manage your Sidebar' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_HOOKS_NAME 'Hooks for theme' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_HOOKS_DESCRIPTION 'Use hooks to put custom code' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_BSF_CUSTOM_FONTS_NAME 'My Custom Fonts' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_BSF_CUSTOM_FONTS_DESCRIPTION 'Add custom fonts' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_CUSTOM_TYPEKIT_FONTS_NAME 'My fonts' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_CUSTOM_TYPEKIT_FONTS_DESCRIPTION 'Add custom typekit font' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set WP_ASTRA_WHITE_LABEL 'true' --path=/srv/users/$usr_name/apps/$app_name/public/

#Import Starter Site using input paramter
#Site ID's can be referenced at https://websitedemos.net/wp-json/wp/v2/astra-sites/
sudo -u $usr_name -i -- wp astra-sites import $template_id --reset --yes --path=/srv/users/$usr_name/apps/$app_name/public/

#Finish
echo done
