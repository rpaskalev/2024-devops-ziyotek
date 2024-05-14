resource "aws_vpc" "ziyo_vpc" {
  cidr_block = var.ziyo_cidr_block

  tags = var.ziyo_vpc_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ziyo_vpc.id

  tags = var.igw_tags
}

resource "aws_route_table" "ziyo_rt" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = var.rt_tags
}

resource "aws_route_table_association" "ziyo_a" {
  subnet_id      = aws_subnet.ziyo_subnet_public.id
  route_table_id = aws_route_table.ziyo_rt.id
}