data "aws_ami" "example" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20240503.0-x86_64-gp2"]
  }
}

output "show_me_the_ami" {
  value = data.aws_ami.example.image_id
}



data "aws_region" "current" {}

data "aws_security_group" "selected" {
    name = "tora.sg"
}

data "aws_region" "current2" {}

data "aws_security_group" "selected2" {
    name = "sg-0ac2f31579f8954a1"
}