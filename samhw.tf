resource "aws_s3_bucket" "zadah_state_bucket" {
  bucket = "zadah-state-bucket"

  tags = {
    Name        = "Zadah State"
    Environment = "State"
  }
}

#versioning

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.zadah_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#object lock for s3

resource "aws_s3_bucket_object_lock_configuration" "zadah-state-bucket" {
  bucket = aws_s3_bucket.zadah_state_bucket.id

  
 rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}

#s3 encryptions

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.zadah_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.zadah_state_bucket.id
  acl    = "public-read"
}

#########subnets#########

resource "aws_subnet" "sam_subnet_public" {
  vpc_id     = aws_vpc.zadah_vpc.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Terraform = "True"
  }
}

resource "aws_subnet" "sam_subnet_private" {
  vpc_id     = aws_vpc.zadah_vpc.id
  cidr_block = "10.10.2.0/24"

  tags = {
    Terraform = "True"
  }
}

##########security group##########

resource "aws_security_group" "zadah_security_group" {
  name        = "zadah_security_group"
  description = "Allow web inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.zadah_vpc.id

  tags = {
    Name = "zadah_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.zadah_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "allow_ssh"

  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_postgres" {
  security_group_id = aws_security_group.zadah_security_group.id
  cidr_ipv4         = aws_vpc.zadah_vpc.cidr_block
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432

  tags = {
    Name = "allow_postgres"

  }
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_traffic" {
  security_group_id = aws_security_group.zadah_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = {
    Name = "allow_all_outbound_traffic"
  }
}

############VPC########

resource "aws_vpc" "zadah_vpc" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Terraform = "true"
  }
}

