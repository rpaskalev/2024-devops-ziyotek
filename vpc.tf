resource "aws_vpc" "ziyo_vpc" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ziyo_vpc.id
}

resource "aws_route_table" "ziyo_rt" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Terraform = "true"
    Name      = "ziyo-2024"
  }
}

resource "aws_route_table_association" "ziyo_a" {
  subnet_id      = aws_subnet.ziyo_subnet_public.id
  route_table_id = aws_route_table.ziyo_rt.id
}

#local resource address + attribute refrence

resource "aws_route_table_association" "ziyo_a_2" {
  subnet_id      = aws_subnet.ziyo_subnet_public_2.id
  route_table_id = aws_route_table.ziyo_rt.id
}