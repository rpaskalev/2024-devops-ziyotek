resource "aws_subnet" "test_subnet_public" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.public_subnet_ciders



  tags = var.public_subnet_tag
  
  }


resource "aws_subnet" "test_subnet_private" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.private_subnet_ciders

  tags = var.private_subnet_tag
}
