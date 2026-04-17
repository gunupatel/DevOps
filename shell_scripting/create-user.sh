#!/bin/bash

# read -p "Enter Username" username

# echo "Username is $username"

# sudo adduser $username

# echo "New user is added"

# echo "The argument you passed through command line is : $0 "

# Arguments concept
# username=$1

# echo "Username is $username"

# if id "$username" &>/dev/null; then
#     echo "User already exists"
# else
#     sudo useradd $username
#     echo "New user is added"
# fi

# Step 1: Check argument
# if [ -z "$1" ]; then  #No argument → stop script
#     echo "❌ Please provide username"
#     exit 1
# fi

# username=$1

# echo "👉 Username: $username"

# # Step 2: Check if user exists
# if id "$username" &>/dev/null; then
#     echo "⚠️ User already exists"
#     exit 0
# fi

# # Step 3: Create user
# if sudo useradd "$username"; then
#     echo "✅ User created successfully"
# else
#     echo "❌ Error creating user"
#     exit 1
# fi