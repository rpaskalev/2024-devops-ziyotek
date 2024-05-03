# Configure AWS as provider
provider "aws" {
  region = "us-east-1"
}

# This block is not required, but tells which version of Terraform/AWS should be used to run code
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"

    }
  }
}

# this block is for remote state (a bucket in S3 which stores "remote state")
# terraform {
#   backend "s3" {
#     bucket = "ferdows-terraform-state"
#     key    = "terraform-state"   ## TF creates this file in AWS S3
#     region = "us-east-1"

#     dynamodb_table = "terraform-lock"   ## TF State Lock file is stored in DynamoDB table
#     encrypt = true                      ## in real-world. This is the name of the Table  
#   }
# }

