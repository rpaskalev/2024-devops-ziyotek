resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.ziyo_vpc.id

   ingress {
    cidr_blocks   = ["0.0.0.0/0"]
    from_port   = 22
    protocol = "tcp"
    to_port     = 22
  }
  ingress {
    cidr_blocks   = ["0.0.0.0/0"]
    from_port   = 5432
    protocol= "tcp"
    to_port     = 5432
  }
  tags = {
    Name = "allow_tls"
  }
}


# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   ingress {
#     cidr_ipv4   = aws_vpc.ziyo_vpc.cidr_block
#     from_port   = 22
#     ip_protocol = "tcp"
#     to_port     = 22
#   }
#   ingress {
#     cidr_ipv4   = aws_vpc.ziyo_vpc.cidr_block
#     from_port   = 5432
#     ip_protocol= "tcp"
#     to_port     = 5432
#   }
# }


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
