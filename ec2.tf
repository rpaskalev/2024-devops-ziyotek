resource "aws_instance" "web_server1" {
  ami                         = var.ec2_ami_id 
  subnet_id                   = aws_subnet.ziyo_subnet_public.id
  vpc_security_group_ids      = [aws_security_group.ziyo_security_group.id, var.additional_sec_group]
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.instance_type 
  key_name                    = var.ec2_key
  ebs_optimized               = var.ebs_optimize
  secondary_private_ips       = var.secondary_private_ips

  tags = {
    Name = "web_server1"
  }
}  