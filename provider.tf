provider "aws" {
  region = var.region
}

# terraform {
# required_providers {
#   aws = {
#     source = "hashicorp/aws
#     version = "~> 3.45"
#   }
# }

#   backend "s3" {
#     bucket = "rady-bucket-1-0-0-0"
#     key    = "terraform-state" #a folder
#     region = "us-east-1"
#     dynamodb_table = "terraform-lock"
#     encrypt = true
#   }
# }

