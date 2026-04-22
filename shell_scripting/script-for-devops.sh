#!/bin/bash

# 1.Check dervice is running or not
#  service="ssh"

# if systemctl is-active --quiet $service; then
#     echo "$service is running"
# else
#    echo "$service is not running"
# fi

# 2.Auto restart service

# service="ssh"
# if systemctl is-active --quiet $service; then
#     echo "$service is running"
# else
#     echo "$service is down, restarting...."
#     sudo systemctl restart $service
# fi

# 3.Disk usage space

# usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
# echo "Disk usage: $usage%"
# if [ $usage -gt 80 ]; then
#     echo "Usage is more than 80%"
# else
#     echo "Usage is less than 80%"
# fi

# 4. Cleanup logs 

# for file in *.log
# do
#     echo "Deleting $file"
#     rm -f $file
# done

#. Function example

# check_service(){
#   service=$1

# if systemctl is-active --quiet $service;
#  then
#     echo "$service is running"
# else
#     echo "$service is not running"
# fi
# }
# check_service ssh;
# check_service docker;

#Error handling

# sudo systemctl restart nginx || {

#     echo "Failed to restart services"
#     exit 1
# }

#     echo "Service restarted successfully"

# ---------Mini Project: User + Service + Disk Check Script----------------

# 👉 This script will:

# Check if user exists
# Check if service is running
# Check disk usage
# Handle errors properly


# 🔹 Error function
error_exit() {
    echo "❌ Error: $1"
    exit 1
}

# 🔹 Check user
check_user() {
    user=$1

    if id "$user" &>/dev/null; then
        echo "✅ User exists: $user"
    else
        error_exit "User $user not found"
    fi
}

# 🔹 Check service
check_service() {
    service=$1

    if systemctl is-active --quiet "$service"; then
        echo "✅ Service running: $service"
    else
        echo "⚠️ Service not running: $service"
        sudo systemctl restart "$service" || error_exit "Failed to restart $service"
    fi
}

# 🔹 Check disk
check_disk() {
    usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

    echo "Disk usage: $usage%"

    if [ "$usage" -gt 80 ]; then
        error_exit "Disk usage is high"
    else
        echo "✅ Disk is under control"
    fi
}

# 🔹 MAIN

check_user "$1"
check_service "$2"
check_disk

echo " All checks completed successfully"