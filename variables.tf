variable "s3_bucket_name-mr" {
  description = "just optional thing"
  default     = "michaelrustams-bucket-2"
  type        = string
}

variable "ec2_key" {
  default = "ziyotek-key.pem"
  type    = string
}

variable "ec2_ami_id" {
  type    = string
  default = "ami-0bb84b8ffd87024d8"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}
variable "days_retention" {
  type    = number
  default = 5
}
variable "associate_public_ip_address" {
  type    = bool
  default = true #!=null!
  #nullable = false
}

variable "ebs_optimize" {
  type    = bool
  default = null
}

# variable "s3_tag" {
#   type = map(any)
#   default = {
#     Name        = "Mybucket-MR"
#     Environment = "Dev-MR"
#   }
# }
variable "secondary_private_ips" {
  type    = list(string)
  default = null
}

# variable "availability_zone" {
#     default = []

# }
variable "region" {
  type    = string
  default = "us-east-1" #eu-central-1 #"us-east-1"

}
# variable "mandatory_tags" {
#   type = map(string) 
#   default = {
#     Terraform = true
#     Company = "Ziyotek"
#     Class = "2024"
#   }

#}

variable "rds_name" {
  type    = string
  default = "rds_michaelrustam-0"

}

variable "user_name" {
  type    = string
  default = "user-michaelrustam-3"

}