resource "aws_instance" "web" {
  ami = var.ec2_ami_id

  subnet_id = aws_subnet.ziyo_subnet_public.id

  key_name                    = var.ec2_key
  instance_type               = var.instance_type
  associate_public_ip_address = true
  # Security group must be declared in the network_interface_id block if we are adding that parameter.
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  iam_instance_profile = aws_iam_instance_profile.test_profile.id
}