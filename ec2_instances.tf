resource "aws_instance" "test" {
  ami             = "ami-0ddda618e961f2270"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.ziyo_subnet_public.id
  key_name        = "ziyotek-key"
  security_groups = [aws_security_group.allow_tls.id]
  tags = {
    Name = "HelloWorld"
  }
}