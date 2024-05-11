provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "ziyotek_bucket_2" {
  bucket = "homework-bucket"

  tags = {
    Name        = "dilnoza"
    Environment = "Dev"

  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "my-bucket-encryption" {
 bucket = dilnoza
 rule {
   apply_server_side_encryption_by_default {
     kms_master_key_id = aws_kms_key.my-s3-SSE-key.arn
     sse_algorithm     = "aws:kms"
   }
 }
}
resource "aws_s3_bucket_versioning" "bucket_versioning" {
 bucket = dilnoza
 versioning_configuration {
   status = "Enabled"
 }
}
resource "aws_s3_bucket_object_lock_configuration" "my-lock-config" {
 bucket = dilnoza
 rule {
   default_retention {
     mode = "COMPLIANCE"
     days = 6
   }
 }
}