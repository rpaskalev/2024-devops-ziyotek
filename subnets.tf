resource "aws_subnet" "ziyo_subnet_public" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  availability_zone = var.az_us-east-1a
  cidr_block        = var.pub_subnet1_cidr

  tags = var.pub_subnet1_tag
}

resource "aws_subnet" "ziyo_subnet_public2" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  availability_zone = var.az_us-east-1b
  cidr_block        = var.pub_subnet2_cidr

  tags = var.pub_subnet2_tag
}

resource "aws_subnet" "ziyo_subnet_private1" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  availability_zone = var.az_us-east-1c
  cidr_block        = var.prv_subnet1_cidr

  tags = var.prv_subnet1_tag
}

resource "aws_subnet" "ziyo_subnet_private2" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  availability_zone = var.az_us-east-1d
  cidr_block        = var.prv_subnet2_cidr

  tags = var.prv_subnet2_tag
}