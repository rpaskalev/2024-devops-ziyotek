resource "aws_subnet" "tory_subnet_public" {
  vpc_id     = aws_vpc.tory_vpc.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Terraform = "True"
    Name      = "Public"
  }
}

resource "aws_subnet" "tory_subnet_private" {
  vpc_id     = aws_vpc.tory_vpc.id
  cidr_block = "10.10.2.0/24"

  tags = {
    Terraform = "True"
    Name      = "Private"
  }
}