#!/bin/bash

# script should be execute with sudo/root access.
if [[ "$UID" -ne 0 ]]
then
        echo 'please run with sudo or root'
        exit 1
fi


# store 1st argument as user name
USER_NAME="${1}"
echo $USER_NAME

# In case of more than one argument
shift
COMMENT="${0}"

# create a password
PASSWORD=$(date +%s%N)
echo  "Password for the user is : $PASSWORD"

# create the user
useradd  -c "${COMMENT}" -m $USER_NAME

# check if the user is successfully created or not
if [[ $? -ne 0 ]]
then
        echo "The Account could not be created"
        exit 1
fi

# set the password for the user
echo "${USER_NAME}:${PASSWORD}" | chpasswd

# check if password is successfully set or not
if [[ $? -ne 0 ]]
then
        echo "The Account could not be created"
        exit 1
fi

# set the password for the user
echo "${USER_NAME}:${PASSWORD}" | chpasswd

# check if password is successfully set or not
if [[ $? -ne 0 ]]
then
        echo "password could not be set"
        exit 1
fi

# force password change on first login
passwd -e $USER_NAME

# Display the username,password and the host where it has been created
echo
echo "Username: $USER_NAME"
echo
echo "Password: $PASSWORD"
echo
echo $(hostname)
