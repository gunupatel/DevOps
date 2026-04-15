# !/bin/bash

read -p "Enter Username" username

echo "Username is $username"

sudo adduser $username

echo "New user is added"

echo "The charchater in " $0 $1 $2"
