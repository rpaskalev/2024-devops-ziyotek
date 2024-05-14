resource "aws_security_group" "ziyo_security_group" {
  name        = var.ziyosgname
  description = var.ziyosgdesc
  vpc_id      = aws_vpc.ziyo_vpc.id

  tags = var.ziyosgtags
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ziyo_security_group.id
  cidr_ipv4         = var.ssh_rule_cidr_ipv4
  from_port         = var.ssh_from_port
  ip_protocol       = var.ssh_ip_protocol
  to_port           = var.ssh_to_port

  tags = var.ssh_tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_postgres" {
  security_group_id = aws_security_group.ziyo_security_group.id
  cidr_ipv4         = aws_vpc.ziyo_vpc.cidr_block
  from_port         = var.postgres_from_port
  ip_protocol       = var.postgres_ip_protocol
  to_port           = var.postgres_to_port

  tags = var.postgres_tags
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_traffic" {
  security_group_id = aws_security_group.ziyo_security_group.id
  cidr_ipv4         = var.outbound_cidr_ipv4
  ip_protocol       = var.outbound_ip_protocol # semantically equivalent to all ports

  tags = var.outbound_tags
}