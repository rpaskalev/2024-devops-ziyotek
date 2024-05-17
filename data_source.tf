variable "security_group_1_id" {
    type = string
    default = "sg-09367113e578a5c90"
}

data "aws_security_group" "sec_group_1" {
  id = var.security_group_1_id
}

variable "security_group_2_id" {
    type = string
    default = "sg-0abdf8c6032554c55"
}

data "aws_security_group" "sec_group_2" {
  id = var.security_group_2_id
}

output name {
    value = [ data.aws_security_group.sec_group_1.arn , data.aws_security_group.sec_group_2.arn ]
}