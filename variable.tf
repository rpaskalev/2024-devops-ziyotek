variable "ami" {
    description = "ID of AMI to use for the instance"
    type = string
    default = "ami-07caf09b362be10b8"
}

variable "associate_public_ip_address" {
    description = "Whether to associate a public IP address with an instance in a VPC"
    type = bool
    default = true
}

variable "instance_type" {
    description = "The type of instance to start"
    type = string
    default = "t2.micro"
}

variable "key_name" {
    description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
    type = string
    default = "ferro-key.pem"
}
variable "instace_tag" {
    type = map(string) 
    default = {
        name = "web_server"
    }
}


variable "region"{
    type = string
    default ="us-east-1"
}

variable bucket_tag{
    type = map(string)
    default = {
        name = "My bucket"
        environment = "Dev"
    }
}

variable "bucket_name" {
    type = string
    default = "tsering-devops-bucket"
}
variable "status" {
    type = string
    default = "Enabled"
}

variable "retentation_mode" {
    type = string 
    default = "COMPLIANCE"
}

variable "retentation_days" {
    type = number
    default = 5
}

variable "sse_algorithm" {
    type = string
    default = "AES256"
}

variable "acl" {
    type = string
    default = "public-read"
}

variable "vpc_cidrblock" {
    type = string
    default = "10.10.0.0/16"
}

variable "vpc_tag" {
    type = map(string)
    default = {
        Terraform = "true"
        Name      = "Ziyo-VPC"
    }
}



variable "gw_tags" {
    type = map(string)
    default = {
        name = "ziyo_igw"
        terraform = "true"
    }
}

variable "routetable_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "routetable_tags" {
    type = map(string)
    default = {
        terraform = "true"
        name = "ziyo-2024"
    }
}


variable "subnet_cidrblock_public" {
    type = string
    default = "10.10.1.0/24"

}

variable "subnet_cidrblock_private" {
    type = string
    default = "10.10.2.0/24"

}


variable "subnet_tags_public" {
    type = map(string)
    default = {
        terraform = "true"
        name = "public"
    }
}

variable "subnet_tags_private" {
    type = map(string)
    default = {
        terraform = "true"
        name = "private"
    }
}


variable "security_groupname" {
    type = string
    default = "ziyo_security_group"
}

variable "sg_tags" {
    type = map(string)
    default = {
        name = "ziyo_security_group"
    }
}

  