resource "aws_vpc" "ziyo_vpc" {
  cidr_block = var.vpc_cidrblock

  tags = {
    Terraform = var.vpc_tag.terraform
    Name      = var.vpc_tag.name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ziyo_vpc.id

  tags = {
    name      = var.gw_tags.name
    Terraform = var.gw_tags.terraform
  }
}

resource "aws_route_table" "ziyo_rt" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = var.routetable_cidr
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Terraform = var.routetable_tags.terraform
    Name      = var.routetable_tags.name
  }
}

resource "aws_route_table_association" "ziyo_a" {
  subnet_id      = aws_subnet.ziyo_subnet_public.id
  route_table_id = aws_route_table.ziyo_rt.id
}