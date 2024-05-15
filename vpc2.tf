 resource "aws_vpc" "test_vpc" {
 cidr_block       = "10.10.0.0/16"
  
   tags = { 
  Terraform = "true"
    Name      =var.test_2024_vpc
  }


 }
