#!/bin/bash
# A simple copy script

app_name=$1
usr_name=$2
template_id=$3

#Enter Maintenance Mode
sudo -u $usr_name -i -- wp maintenance-mode activate --path=/srv/users/$usr_name/apps/$app_name/public/

# Install Starter Site on Target WP - Sudo (Using Astra Starters)

#Cleanup Default WP - Remove unwanted Themes and Plugins
sudo -u $usr_name -i -- wp plugin delete akismet hello --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp theme delete twentynineteen twentyseventeen twentysixteen --path=/srv/users/$usr_name/apps/$app_name/public/

#Cleanup Default WP - Remove unwanted Posts and Widgets
sudo -u $usr_name -i -- wp post delete $(wp post list --post_type='post' --format=ids --path=/srv/users/$usr_name/apps/$app_name/public/ --allow-root) 
sudo -u $usr_name -i -- wp post delete $(wp post list --post_type='page' --format=ids --path=/srv/users/$usr_name/apps/$app_name/public/ --allow-root)
sudo -u $usr_name -i -- wp widget delete $(wp widget list sidebar-1 --format=ids) --path=/srv/users/$usr_name/apps/$app_name/public/

#Cleanup Default WP - Update Site Name, Comments, Permalink, Datetime

sudo -u $usr_name -i -- wp option update blogdescription "Another WordPress Site Created with ReadyPress" --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option set default_comment_status closed --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp rewrite structure '/%postname%/' --hard --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp option update timezone_string "Australia/Melbourne" --path=/srv/users/$usr_name/apps/$app_name/public/

#Install Required Theme & Plugins
sudo -u $usr_name -i -- wp theme install astra --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install elementor --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/plugins/elementor-pro.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/starter-sites/plugins/astra-addon-plugin.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/starter-sites/plugins/ultimate-elementor.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp plugin install "https://github.com/daneporter/ropedigital/raw/master/starter-sites/plugins/astra-premium-sites.zip" --activate --path=/srv/users/$usr_name/apps/$app_name/public/


#Configure Astra Pro settings and set Elementor as page builder
sudo -u $usr_name -i -- wp astra-sites page_builder set elementor --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_AUTHOR 'ReadyPress' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_AUTHOR_URL 'https://readypress.io' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_AGENCY_LICENCE 'https://readypress.io' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_NAME 'ReadyPress Starter Theme' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_DESCRIPTION 'Everything you need to create amazing WordPress sites' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_SCREENSHOT 'www.your-theme-screenshot-url.com' --path=/srv/users/$usr_name/apps/$app_name/public/          
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_PRO_NAME 'ReadyPress Addons' --path=/srv/users/$usr_name/apps/$app_name/public/      
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_PRO_DESCRIPTION 'Everything required to extend the features of ReadyPress' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_SITES_NAME 'Starter Sites' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_SITES_DESCRIPTION 'Library of Starter sites' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_BSF_LW_SB_NAME 'ReadyPress Sidebar Manager' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_BSF_LW_SB_DESCRIPTION 'Manage your Sidebar' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_HOOKS_NAME 'Hooks for ReadyPress' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_ASTRA_HOOKS_DESCRIPTION 'Use hooks for additional custom code' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_BSF_CUSTOM_FONTS_NAME 'Custom Fonts' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_BSF_CUSTOM_FONTS_DESCRIPTION 'Add custom fonts' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_CUSTOM_TYPEKIT_FONTS_NAME 'Typekit fonts' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set AST_WL_CUSTOM_TYPEKIT_FONTS_DESCRIPTION 'Add custom typekit font' --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp config set WP_ASTRA_WHITE_LABEL 'true' --path=/srv/users/$usr_name/apps/$app_name/public/

#Import Starter Site using input paramter
#Site ID's can be referenced at https://websitedemos.net/wp-json/wp/v2/astra-sites/
sudo -u $usr_name -i -- wp astra-sites import $template_id --reset --yes --path=/srv/users/$usr_name/apps/$app_name/public/

#Activate Licence for Pro Product Sets
sudo -u $usr_name -i -- wp brainstormforce license activate astra-addon e08971ab3a707c980f0ca371e303523e --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp brainstormforce license activate astra-pro-sites 44623b583829033d224e16545d8153ca --path=/srv/users/$usr_name/apps/$app_name/public/
sudo -u $usr_name -i -- wp brainstormforce license activate uael 28d03061107b4b38e7a1d7ce7bc283eb --path=/srv/users/$usr_name/apps/$app_name/public/

#Exit Maintenance Mode
sudo -u $usr_name -i -- wp maintenance-mode deactivate --path=/srv/users/$usr_name/apps/$app_name/public/

#Finish
echo done
