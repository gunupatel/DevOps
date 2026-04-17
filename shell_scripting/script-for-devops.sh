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

# 4. Cleanup logs file

for file in *.log
do
    echo "Deleting $file"
    rm -f $file
done
