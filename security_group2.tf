resource "aws_security_group" "test_security_group" {
  name        = "test_security_group"
  description = "Allow web inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.test_vpc.id
  name   = var.aws_security_group
  vpc_id = aws_vpc.test_vpc.id

  tags = var.test_seg_group
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.test_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port
  ip_protocol       = var.tcp
  to_port           = var.port

  resource "aws_vpc_security_group_ingress_rule" "allow_postgres" {
  security_group_id = aws_security_group.test_security_group.id
    from_port         = var.port
  ip_protocol       = var.tcp
  to_port           = var.port
