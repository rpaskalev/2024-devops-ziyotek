variable "s3_bucket_name" {

    type    = string
    default ="aziza-bucket"

}


variable "ec2_key" {
    type    = string
    default ="ziyotek-key"

}

variable "ec2_ami_id" {
    type     = string
    default  = "ami-07caf09b362be10b8"

}

variable "instance_type" {
    description ="assign value for instance compute"
    type     = string 
    default  ="t2.micro"
}

variable "associate_public_ip_address" {
    type  = bool
    default = true

}

variable "additional_sec_group" {
    type  = string
    default = ""

}
variable "ebs_optimize" {
    type  = bool
    default = true
}


variable "s3_tag" {
  type   = map
  default = {
  Name                = "test-bucket" 

  Environment          = "test" 

  }
 }
 variable "secondary_private_ips" {
    type = list

 }
 variable "public_subnet_ids" {
  type        = string
  default     = []
  description = ""10.10.0.0/16""
  sensitive   = true
 }

variable "private_subnet_ids" {
  type        = string
  default     = []
  description = "10.10.1.0/24"
  sensitive   = true
 }

variable "aws_security_group" {
  type    = string
  default = "test_security_group"
}

variable "test_seg_group" {
    type = string
    default = {
      Name = "test_security_group"
     }  
 }

 variable "cidr_ipv4" {
    type = string
    default = "0.0.0.0/0" 

 }
variable "tcp" {
     type = string
    default = "tcp"

}

variable "allow_ssh" {
  type = map
  default = {
    Name = "allow_ssh"
  }
}

variable "port" {
type    = string
default  =22
} 
variable "port" {
type    = string
default  =5432
} 
variable "test_2024_vpc" {
  type    = string
  default = "10.0.0.0/16"
}


