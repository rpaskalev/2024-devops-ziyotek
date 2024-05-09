resource "aws_instance" "web" {
  ami = "ami-07caf09b362be10b8"

  subnet_id = aws_subnet.ziyo_subnet_public.id

  key_name                    = "ziyotek-key"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  # Security group must be declared in the network_interface_id block if we are adding that parameter.
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

}