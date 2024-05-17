variable "security_group_1" {
    type = string
    default = "sg-09367113e578a5c90"
}

data "aws_security_group" "sec_group_1" {
  id = var.security_group_1
}

variable "security_group_2" {
    type = string
    default = "sg-0abdf8c6032554c55"
}

data "aws_security_group" "sec_group_2" {
  id = var.security_group_2
}

output "show_me_security_groups" {
    value = [ data.aws_security_group.sec_group_2.arn , data.aws_security_group.sec_group_1.arn ]
}