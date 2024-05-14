variable "ziyo_cidr_block" {
    type = string 
    default = "10.10.0.0/16"
}

variable "ziyo_vpc_tags" {
    type = map(string)
    default = {
        Terraform = true
        Name = "Ziyo-VPC"
    }
}

# variable "vpc_id" {
#     type = string
#     default = aws_vpc.ziyo_vpc.id
# }

variable "igw_tags" {
    type = map(string)
    default = {
        name = "ziyo_igw"
        Terraform = "true"
    }
}

variable "route_cidr_block" {
    type = string
    default = "0.0.0.0/0"
}

variable "gw_id" {
    type = string
    default = "aws_internet_gateway.gw.id"
}

variable "rt_tags" {
    type = map(string)
    default = {
        Terraform = "true"
        Name = "ziyo-2024"
    }
}
//These variables could possibly work.
# variable "subnet_id_a" {
#     type = string
#     default = "aws_subnet.ziyo_subnet_public.id"
# }

# variable "rt_id_a" {
#     type = string
#     default = "aws_route_table.ziyo_rt.id"
# }
//subnets.tf variables
variable "pub_subnet_cidr_block" {
    type = string
    default = "10.10.1.0/24"
}

variable "pub_tags" {
    type = map(string)
    default = {
        Terraform = "True"
        Name = "Public"
    }
}

variable "priv_subnet_cidr_block" {
    type = string
    default = "10.10.2.0/24"
}

variable "priv_tags" {
    type = map(string)
    default = {
        Terraform = "True"
        Name = "Private"
    }
}

//security_group.tf Variables
variable "ziyosgname" {
    type = string
    default = "ziyo_security_group"
}

variable "ziyosgdesc" {
    type = string
    default = "Allow web inbound traffic and all outbound traffic"
}

variable "ziyosgtags" {
    type = map(string)
    default = {
        Name = "ziyo_security_group"
    }
}

variable "ssh_rule_cidr_ipv4" {
    type = string
    default = "0.0.0.0/0"
}

variable "ssh_ip_protocol" {
    type = string
    default = "tcp"
}

variable "ssh_from_port" {
    type = number
    default = 22
}

variable "ssh_to_port" {
    type = number
    default = 22
}

variable "ssh_tags" {
    type = map(string)
    default = {
        Name = "allow_ssh"
    }
}

variable "postgres_from_port" {
    type = number
    default = 5432
}

variable "postgres_to_port" {
    type = number
    default = 5432
}

variable "postgres_ip_protocol" {
    type = string
    default = "tcp"
}

variable "postgres_tags" {
    type = map(string)
    default = {
        Name = "allow_postgres"
    }
}

variable "outbound_cidr_ipv4" {
    type = string
    default = "0.0.0.0/0"
}

variable "outbound_ip_protocol" {
    type = string
    default = "-1"
}

variable "outbound_tags" {
    type = map(string)
    default = {
        Name = "allow_all_outbound_traffic"
    }
}
//s3.tf variables
variable "ziyotek_bucket" {
    type = string
    default = "your-name-devops-bucket42"
}

variable "bucket_tags" {
    type = map(string)
    default = {
        Name = "My bucket"
        Environment = "Dev"
    }
}

variable "version_status" {
    type = string
    default = "Enabled"
}

variable "bucket_object_lock_mode" {
    type = string
    default = "COMPLIANCE"
}

variable "bucket_object_lock_days" {
    type = number
    default = 5
}

variable "encryption" {
    type = string
    default = "AES256"
}

variable "acl_type" {
    type = string
    default = "public-read"
}

variable "example_public_acls" {
    type = bool
    default = false
}

variable "example_public_policy" {
    type = bool
    default = false
}

variable "example_ignore_public_acls" {
    type = bool
    default = false
}

variable "example_restrict_public_buckets" {
    type = bool
    default = false
}

variable "obj_ownership" {
    type = string
    default = "BucketOwnerPreferred"
}
//provider.tf variables
variable "region" {
    type = string
    default = "us-east-1"
}

//ec2.tf variables
variable "ami_id" {
    type = string
    default = "ami-07caf09b362be10b8"
}

variable "associate_public" {
    type = bool
    default = true
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ec2_tags"{
    type = map(string)
    default = {
        Name = "web_server1"
    }
}

variable "ec2_monitoring" {
    type = bool
    default = true
}

variable "ebs_optimized" {
    type = bool
    default = true
}

//Availability Zones
variable "cidr_block_west" {
    type = string
    default = "10.10.3.0/24"
}

variable "cidr_block_east" {
    type = string
    default = "10.10.4.0/24"
}

variable "az_west" {
    type = string
    default = "us-east-1c"
}

variable "az_east" {
    type = string
    default = "us-east-1d"
}