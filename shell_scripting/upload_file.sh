#!/bin/bash

file="demo_file_to_upload_s3.txt"

bucket="gunjan-devops-bucket"

if [ ! -f "$file" ]; then
    echo "File not Found"
    exit 1
fi

aws s3 cp "$file" s3://$bucket/ || {
    echo "Upload Failed"
    exit 1
}

echo "$file File uploaded"