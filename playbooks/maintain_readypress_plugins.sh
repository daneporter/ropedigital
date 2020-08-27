#!/bin/bash
# A quick script to update licence when it drops and then update the relevant plugins

#Activate Licence for Pro Product Sets
wp brainstormforce license activate astra-addon e08971ab3a707c980f0ca371e303523e
wp brainstormforce license activate astra-pro-sites 44623b583829033d224e16545d8153ca
wp brainstormforce license activate uael 28d03061107b4b38e7a1d7ce7bc283eb
wp plugin deactivate elementor-pro
wp plugin uninstall elementor-pro
wp plugin install "https://github.com/daneporter/ropedigital/raw/master/starter-sites/plugins/elementor-pro.zip" --activate
wp elementor-pro license activate 39b245eba938b567dbb8cdf095ec447f



wp plugin update astra-addon elementor header-footer-elementor elementor-pro astra-pro-sites ultimate-elementor wpforms-lite
