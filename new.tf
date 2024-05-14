resource "aws_instance" "dilnoza_server1" {
  ami               = "var_ec2_ami"
  instance_type      = "var.instance_type"
}

resource "aws_s3_bucket" "dilnoza_bucket" {
  bucket           = "var_s3_bucketname"
}

resource "aws_vpc" "dil_vpc" {
  cidr_block = "var.cidr_block"
  }


resource "aws_subnet" "dil_subnet_public" {
  vpc_id     = "var.vpc.id"
}
  