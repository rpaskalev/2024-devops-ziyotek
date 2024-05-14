# variable "s3_bucket_name-4" {
#     description = "just optional thing"
#     default = "michaels-bucket"
#      type = string 
# }

variable "ec2_key" {
    default = "ziyotek-key" 
    type = string
}

variable "ec2_ami_id" {
    default = "ami-07caf09b362be10b8"
}

variable "instance_type" {
    default = "t2.micro"    
  
}
variable "days_retention" {
    type = number
    default = 5
}
variable "associate_public_ip_address" {
    type = bool
    default = true
}

variable "s3_tag" {
    type = map
    default = {
        Name =  "Mybucket"
        Environment = "Dev"
    }
}
variable "secondary_private_ips" {
    type = list(string)
    default = null
}
# variable "availability_zone" {
#     default = []
  
# }