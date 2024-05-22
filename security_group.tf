resource "aws_security_group" "ziyo_security_group" {
  name        = "ziyo_security_group"
  description = local.description #"Allow web inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.ziyo_vpc.id
  ingress {
    description = "All from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.my_local_tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ziyo_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "allow_ssh"

  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_postgres" {
  security_group_id = aws_security_group.ziyo_security_group.id
  cidr_ipv4         = aws_vpc.ziyo_vpc.cidr_block
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432

  tags = {
    Name = "allow_postgres"

  }
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_traffic" {
  security_group_id = aws_security_group.ziyo_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = {
    Name = "allow_all_outbound_traffic"
  }
}