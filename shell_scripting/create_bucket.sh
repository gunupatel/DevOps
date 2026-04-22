#!/bin/bash

bucket_name="gunjan-devops-bucket"

aws s3 mb s3://$bucket_name || {
    echo "Failed to create bucket"
    exit 1
}

echo "bucket created : $bucket_name"