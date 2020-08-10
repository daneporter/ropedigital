#!/bin/bash
## This script needs to exist on the Primary Host/Jumpox/Bastion Server. It is used to tunnel SSH commands to
## This is used to create a new Admin user, with details provided by the Customer
## Assumes a hosting instance has been created using serverpilot

## Usage: ./ssh.sh [target ssh username] [target ssh password] [target ssh IP] [sp app name] [sp username] [client email] [wp password]

################################################################
##Change Log##
## v0.1 - Initial - Cloned from run_playbook.sh
## v0.2 - Changed from using SSHpass to standard SSH after installing keys
################################################################

#SSH Remote Script

#V2 - No password

username=$1
ip=$2
app_name=$3
usr_name=$4
email=$5
usr_pw=$6

#Get copies of the latest scripts onto the remote host

ssh $username@$ip << EOF
cd /var/opt/ 
wget -q https://raw.githubusercontent.com/daneporter/ropedigital/master/scripts/create-admin.sh -O create-admin.sh
chmod 700 *.sh
EOF


#Invoke Create Admin script on remote host
ssh $username@$ip << EOF
cd /var/opt/ 
./create-admin.sh $app_name $usr_name $email $usr_pw
EOF

exit
exit
