resource "aws_instance" "web_server-5" {

  ami                         = var.ec2_ami_id
  subnet_id                   = aws_subnet.ziyo_subnet_public.id
  vpc_security_group_ids      = [aws_security_group.ziyo_security_group.id]
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.deployer.key_name #var.ec2_key # "ziyotek-key.pem"
  ebs_optimized               = var.ebs_optimize
  #vpc_security_group_ids      = [aws_security_group.ziyo_security_group.id]
  secondary_private_ips = var.secondary_private_ips
  # availability_zone         = var.availability_zone
  #tags = var.mandatory_tags
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa-4096-example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# key deployment!?
resource "aws_key_pair" "deployer" {
  key_name   = "ziyo-deployer-key"
  public_key = tls_private_key.rsa-4096-example.public_key_openssh #"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

resource "aws_ssm_parameter" "pass_gen-for-ec2" {
  name  = "ssh_key_with_ssm_parameter-1"
  type  = "String"
  value = tls_private_key.rsa-4096-example.private_key_pem
}

# output "ssh_key" {
#   value = tls_private_key.rsa-4096-example.private_key_pem
# }