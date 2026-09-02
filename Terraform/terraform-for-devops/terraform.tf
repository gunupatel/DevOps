terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
    backend "s3" {
      bucket = "gunjan-tf-bucket-2026-001"
      key    = "terraform.tfstate"
      region = "us-east-1"
      dynamodb_table = "basic-dynamodb-table"
    }
  
}