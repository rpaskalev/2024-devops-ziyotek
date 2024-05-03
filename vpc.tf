# Create a VPC
resource "aws_vpc" "homework-vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name  = "homework-vpc"
    owner = "ferdows"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.homework-vpc.id

  tags = {
    Name  = "my-igw"
    owner = "ferdows"
  }
}

resource "aws_route_table" "homework-rt" {
  vpc_id = aws_vpc.homework-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name  = "homework-rt"
    owner = "ferdows"
  }
}

# Route Table association with subnets
resource "aws_route_table_association" "rt" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.homework-rt.id
}

resource "aws_route_table_association" "rt-1" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.homework-rt.id
}

