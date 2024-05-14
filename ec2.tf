resource "aws_instance" "web_server1" {
  ami                         = var.ami_id
  subnet_id                   = aws_subnet.ziyo_subnet_public.id
  vpc_security_group_ids      = [aws_security_group.ziyo_security_group.id]
  associate_public_ip_address = var.associate_public
  instance_type               = var.instance_type
  #key_name                    = "ferro-key.pem"
  monitoring = var.ec2_monitoring
  //ebs_optimized = var.ebs_optimized
  tags = var.ec2_tags
}  