resource "aws_subnet" "ziyo_subnet_public" {
  vpc_id     = aws_vpc.ziyo_vpc.id
  cidr_block = var.subnet_cidrblock_public

  tags = {
    Terraform = var.subnet_tags_public.terraform
    Name      = var.subnet_tags_public.name
  }
}

resource "aws_subnet" "ziyo_subnet_private" {
  vpc_id     = aws_vpc.ziyo_vpc.id
  cidr_block = var.subnet_cidrblock_private

  tags = {
    Terraform = var.subnet_tags_private.terraform
    Name      = var.subnet_tags_private.name
  }
}