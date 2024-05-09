# resource "aws_s3_bucket" "ziyotek_bucket" {
#   bucket        = "rady-devops-2-24-bucket-1"
#   force_destroy = true
#   tags = {
#     Name        = "My bucket"
#     Environment = "sbx"
#   }
# }
resource "aws_s3_bucket" "ziyotek_bucket" {
  bucket        = "michaelrustam-devops-bucket"
  object_lock_enabled = true
  force_destroy = true
  tags = {
    Name        = "My bucket"
    Environment = "sbx"
  }
}
#versioning
resource "aws_s3_bucket_versioning" "ziyotek_bucket-version" {
  bucket = aws_s3_bucket.ziyotek_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ziyotek_bucket-bucket-encryption" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}
# object lock
resource "aws_s3_bucket_object_lock_configuration" "ziyotek_bucket-obj_lock" {
  bucket = aws_s3_bucket.ziyotek_bucket.bucket

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}
# Public access 
resource "aws_s3_bucket_public_access_block" "public_access-ACL" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}