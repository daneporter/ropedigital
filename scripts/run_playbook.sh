#!/bin/bash
## This script needs to exist on the Primary Host/Jumpox/Bastion Server. It is used to tunnel SSH commands to
## the target remote hosting server for the purpose of installing a requested Playbook on an existing WP instance.
## Assumes a hosting instance has been created using serverpilot

## Usage: ./run_playbook.sh [target ssh username] [target ssh password] [target ssh IP] [sp app name] [sp username] [client email] [wp password] [template_id]


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

sshpass -p $password ssh $username@$ip <<'ENDSSH'
cd /var/opt/
wget -q https://raw.githubusercontent.com/daneporter/ropedigital/master/playbooks/starter_site_playbook.sh -O starter_site_playbook.sh
chmod 700 starter_site_playbook.sh
ENDSSH

#Invoke Playbook Setup script on remote host
sshpass -p $password ssh $username@$ip  ". /var/opt/starter_site_playbook.sh $app_name $usr_name $template_id" <<'ENDSSH'
exit
ENDSSH
exit
exit
