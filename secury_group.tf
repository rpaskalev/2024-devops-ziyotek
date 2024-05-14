#s3_bucket 
resource "aws_s3_bucket" "test_bucket" { 

  bucket = "test-1" 

  tags = { 

  Name        = "test-bucket" 

  Environment = "test" 

  } 

} 
#ec2_instance.tf
resource "aws_instance""test_ec2-instance" { 

  ami = "ami-07caf09b362be10b8"   

  instance_type = "t2.micro" 

  subnet_id     =aws_subnet.test_subnet_public.id 

  key_name      = "ziyotek-key" 

  vpc_security_group_ids = [aws_security_group.test_vpc.id] 

  tags = { 

    Name = "Hello" 

  } 

} 
#vpc.tf
resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.10.0.0/16"
  
  tags = {
    Terraform = "true"
    Name      ="Test-2024-VPC"
  }


}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Terraform = "true"
  }
}
resource "aws_route_table" "test_rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Terraform  = "true"
    Name = "test-2024"
  }
}

#subnet.tf
resource "aws_subnet" "test_subnet_public" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Terraform = "True"
    Name      ="Public"
  }
}
resource "aws_subnet" "test_subnet_private" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.10.2.0/24"

  tags = {
    Terraform = "True"
    Name      = "Private"
  }


resource "aws_route_table_association" "test_a" {
  subnet_id      = aws_subnet.test_subnet_public.id
  route_table_id = aws_route_table.test_rt.id
}
#security_group.tf
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.test_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

