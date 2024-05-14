resource "aws_subnet" "ziyo_subnet_public" {
  vpc_id     = aws_vpc.ziyo_vpc.id
  cidr_block = var.pub_subnet_cidr_block

  tags = var.pub_tags
}

resource "aws_subnet" "ziyo_subnet_private" {
  vpc_id     = aws_vpc.ziyo_vpc.id
  cidr_block = var.priv_subnet_cidr_block

  tags = var.priv_tags
}

resource "aws_subnet" "ziyo_subnet_azeastc" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.cidr_block_west
  availability_zone = var.az_west
}

resource "aws_subnet" "ziyo_subnet_azeastd" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.cidr_block_east
  availability_zone = var.az_east
}