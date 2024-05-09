resource "aws_instance" "web_server1" {
  ami                         = "ami-07caf09b362be10b8"
  subnet_id                   = aws_subnet.ziyo_subnet_public.id
  vpc_security_group_ids      = [aws_security_group.ziyo_security_group.id]
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  #key_name                    = "ferro-key.pem"


  tags = {
    Name = "web_server1"
  }
}  