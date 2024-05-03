# Create public subnet1
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.homework-vpc.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name  = "public_subnet"
    owner = "ferdows"
  }
}

# Create public subnet2
resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.homework-vpc.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name  = "private_subnet"
    owner = "ferdows"
  }
} 