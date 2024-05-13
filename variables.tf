variable "s3_bucket_name" {
    default = "eric-ziyo-2024"
}

variable "ec2_key" {
    default = "ziyotek-key"
}

variable "ec2_ami_id" {
    default = "ami-07caf09b362be10b8"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "additional_sec_group" {
    type = string
    default = ""
}

variable "s3_tag" {
    type = map
    default = {
        Name     = "My Bucket"
        Environment = "Dev"
    }
}