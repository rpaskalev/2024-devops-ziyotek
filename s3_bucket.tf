resource "aws_s3_bucket" "my_hw_bucket" {
  bucket = "sun-ziyotek72"

}
resource "aws_s3_bucket_versioning" "my_hw_bucket" {
  bucket = aws_s3_bucket.my_hw_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "my_hw_bucket" {
  bucket = aws_s3_bucket.my_hw_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_object_lock_configuration" "my_hw_bucket" {
  bucket = aws_s3_bucket.my_hw_bucket.id
  object_lock_enabled = "Enabled"
  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "my_hw_bucket" {
  bucket = aws_s3_bucket.my_hw_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "my_hw_bucket" {
  bucket = aws_s3_bucket.my_hw_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "my_hw_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.my_hw_bucket,
    aws_s3_bucket_public_access_block.my_hw_bucket,
  ]

  bucket = aws_s3_bucket.my_hw_bucket.id
  acl    = "public-read"
}
