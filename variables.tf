variable "s3_bucket_name" {
  type= string
  default = "zadah-state-bucket"
}

variable "ec2_key" {
  type = string
  default = "sam-key-terraform"
}


variable "ec2_ami_id" {
  default = "ami-07caf09b362be10b8"
}

variable "instance_type" {
  description = "assign value for instance compute"
  type        = string
  default     = "t2.micro"
}

variable "days_retention" {
  type    = number
  default = 5
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

variable "additional_sec_group" {
  type    = string
  default = ""
}

variable "ebs_optimize" {
  type    = bool
  default = null
}

variable "s3_tag" {
  type = map(any)
  default = {
    Name        = "Zadah State"
    Environment = "State"
  }
}

variable "secondary_private_ips" {
  type    = list(string)
  default = null
}

variable "mandatory_tags" {
    type = map(string)
    default = {
        Terraform = true
        Company = "ziyotek"
        Class = "2024"
    }
}