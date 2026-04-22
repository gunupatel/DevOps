#!/bin/bash

ami="ami-0c33c6bd24cee108b"   # change based on region
instance_type="t3.micro"
key_name="linux_for_devops_key"

aws ec2 run-instances \
--image-id $ami \
--count 1 \
--instance-type $instance_type \
--key-name $key_name || {
    echo "❌ EC2 creation failed"
    exit 1
}

echo "✅ EC2 instance created"