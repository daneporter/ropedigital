#!/bin/bash

## Usage: ./run_site_template.sh [target ssh username] [target ssh password] [target ssh IP] [sp app name] [sp username] [client email] [wp password] [template_id]

################################################################
##Change Log##
## v0.1 - Initial - Cloned from run_playbook.sh
## v0.2 - Changed from using SSHpass to standard SSH after installing keys
################################################################

#SSH Remote Script


username=$1
password=$2
ip=$3
app_name=$4
usr_name=$5
email=$6
usr_pw=$7
template_id=$8


#Get copies of the latest scripts onto the remote host
ssh $username@$ip << EOF
cd /var/opt/ 
wget -q https://raw.githubusercontent.com/daneporter/ropedigital/master/playbooks/starter_site_playbook.sh -O starter_site_playbook.sh
chmod 700 starter_site_playbook.sh
EOF



#Invoke Playbook Setup script on remote host
#ssh $username@$ip  ". /var/opt/starter_site_playbook.sh $app_name $usr_name $template_id"
#exit
ssh $username@$ip << EOF
. /var/opt/starter_site_playbook.sh $app_name $usr_name $template_id $email
EOF


exit


