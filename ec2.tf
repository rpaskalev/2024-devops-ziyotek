resource "aws_instance" "web_server1" {
  ami                         = var.ec2_ami_id
  subnet_id                   = aws_subnet.ziyo_subnet_public2.id
  vpc_security_group_ids      = [aws_security_group.ziyo_security_group.id]
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.ec2_type
  key_name                    = var.ec2_key
  monitoring                  = var.ec2_monitoring
  #ebs_optimized               = var.ebs_optimization

  tags = var.ec2_tag1
}

