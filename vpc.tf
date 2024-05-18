resource "aws_vpc" "tory_vpc" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tory_vpc.id
}

resource "aws_route_table" "tory_rt" {
  vpc_id = aws_vpc.tory_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Terraform = "true"
    Name      = "tory-2024"
  }
}

resource "aws_route_table_association" "tory_a" {
  subnet_id      = aws_subnet.tory_subnet_public.id
  route_table_id = aws_route_table.tory_rt.id
}

#local resource address + attribute refrence