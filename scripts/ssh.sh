#!/bin/bash
## This script needs to exist on the Primary Host/Jumpox/Bastion Server. It is used to tunnel SSH commands to
## the target remote hosting server for the purpose of configuring a new WP instance.
## Assumes a hosting instance has been created using serverpilot

## Usage: ./ssh.sh [target ssh username] [target ssh password] [target ssh IP] [sp app name] [sp username] [client email] [wp password]

################################################################
##Change Log##
## v0.1 - Initial - Cloned from run_playbook.sh
## v0.2 - Changed from using SSHpass to standard SSH after installing keys
################################################################

#SSH Remote Script


#username=$1
#password=$2
#ip=$3
#app_name=$4
#usr_name=$5
#email=$6
#usr_pw=$7

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
wget -q https://raw.githubusercontent.com/daneporter/ropedigital/master/scripts/env-setup.sh -O env-setup.sh
wget -q https://raw.githubusercontent.com/daneporter/ropedigital/master/scripts/create-admin.sh -O create-admin.sh
chmod 700 *.sh
EOF

#sshpass -p $password ssh $username@$ip <<'ENDSSH'
#cd /var/opt/
#wget -q https://raw.githubusercontent.com/daneporter/ropedigital/master/scripts/env-setup.sh -O env-setup.sh
#wget -q https://raw.githubusercontent.com/daneporter/ropedigital/master/scripts/create-admin.sh -O create-admin.sh
#chmod 700 *.sh
#ENDSSH

#Invoke Create Admin script on remote host
#sshpass -p $password ssh $username@$ip ". /var/opt/create-admin.sh $app_name $usr_name $email $usr_pw" <<'ENDSSH'
#exit
#ENDSSH

#Invoke Create Admin script on remote host
ssh $username@$ip << EOF
cd /var/opt/ 
./create-admin.sh $app_name $usr_name $email $usr_pw
EOF

ssh $username@$ip << EOF
cd /var/opt/
./env-setup.sh $app_name $usr_name
EOF

#Invoke Environment Setup script on remote host
#sshpass -p $password ssh $username@$ip  ". /var/opt/env-setup.sh $app_name $usr_name" <<'ENDSSH'
#exit
#ENDSSH
exit
exit
