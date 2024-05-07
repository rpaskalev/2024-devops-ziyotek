provider "aws" {   

 region = "us-east-1"   

  

}   
  terraform {    

  

 required_providers {   

 aws = {   

  source ="hashicorp/aws"   

 version = "~> 3.45"   

  }   

 }   

   backend "s3" {  

   bucket = "s3aziza2"  

  key    = "state-remote"  

  region = "us-east-1"  

   dynamodb_table = "terraform-lock1" 

   encrypt = true 

  } 

  }  

 