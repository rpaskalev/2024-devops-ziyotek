resource "aws_instance" "web_server88" {
  ami                         = "ami-0bb84b8ffd87024d8"
  subnet_id                   = aws_subnet.ziyo_subnet_public.id
  vpc_security_group_ids      = [aws_security_group.ziyo_security_group.id]
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  #key_name                    = "ziyotek-key"


  tags = {
    Name = "web_server88"
  }
}  

resource "aws_ec2_availability_zone_group" "web_server88" {
  group_name    = "us-east-1-lax-1"
  opt_in_status = "opted-in"
}