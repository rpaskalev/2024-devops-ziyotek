resource "aws_s3_bucket" "ziyotek_bucket" {
  bucket        = "rady-devops-2-24-bucket-1"
  force_destroy = true
  tags = {
    Name        = "My bucket"
    Environment = "sbx"
  }
}

resource "aws_s3_bucket" "ziyotek_bucket_2" {
  bucket        = "rady-devops-2-24-bucket-2"
  force_destroy = true
  tags = {
    Name        = "My bucket"
    Environment = "sbx"
  }
}

resource "aws_s3_bucket" "ziyotek_bucket_3" {
  bucket = "rady-devops-2-24-bucket-3"

  tags = {
    Name        = "My bucket"
    Environment = "sbx"
  }
}