

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0bb84b8ffd87024d8"
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "monitoring" {
  description = "Enable detailed monitoring for the EC2 instance"
  type        = bool
  default     = true
}

variable "ebs_optimized" {
  description = "Enable EBS optimization for the EC2 instance"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to assign to the EC2 instance"
  type        = map(string)
  default     = {
    Name        = "ec2user88"
    Environment = "Development"
    
  }
}

variable "root_volume_type" {
  description = "The type of the root EBS volume"
  type        = string
  default     = "gp2"
}

