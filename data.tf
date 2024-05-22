data "aws_ami" "example" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20240503.0-x86_64-*"]
  }
}

output "show_me_the_ami" {
  value = data.aws_ami.example.image_id
}

data "aws_key_pair" "example" {
  key_name = var.ssh_key
}

data "aws_region" "current" {}
