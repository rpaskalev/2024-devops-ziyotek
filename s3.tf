resource "aws_s3_bucket" "monopoly_bucket" {
  bucket        = "iryna-devops-2-24-bucket-1"
  force_destroy = true
  tags = {
    Name        = "My_monopoly_bucket"
    Owner = "Devops_Iryna"
  }
}


resource "aws_s3_bucket_versioning" "versioning_monopoly_bucket" {
  bucket = aws_s3_bucket.monopoly_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_monopoly_bucket" {
  bucket = aws_s3_bucket.monopoly_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }


resource "aws_s3_bucket_acl" "acl_monopoly_bucket" {
  bucket = aws_s3_bucket.monopoly_bucket.id
  acl    = "public-read"
}


resource "aws_s3_bucket_object_lock_configuration" "object_lock_monopoly_bucket" {
  bucket = aws_s3_bucket.monopoly_bucket.id
  object_lock_enabled = "Enabled"
  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}