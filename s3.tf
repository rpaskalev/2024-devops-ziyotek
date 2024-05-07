
resource "aws_s3_bucket" "aziza-s3-bucket" {
  bucket        = "aziza-s3-bucket"
  force_destroy = true
  tags = {
  Name  = "aziza-s3-bucket"
  Owner = "aziza"
  }
}

# versioning
resource "aws_s3_bucket_versioning" "versioning_Ziyotek-s3" {
  bucket = aws_s3_bucket.aziza-s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}  
#Encryption 
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}
 

 
resource "aws_s3_bucket_server_side_encryption_configuration" "s3-aziza-encryption" {
  bucket = aws_s3_bucket.aziza-s3-bucket.id
 
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
# object lock
resource "aws_s3_bucket_object_lock_configuration" "object-lock" {
  bucket = aws_s3_bucket.aziza-s3-bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}
# public access


resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.aziza-s3-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public-read" {
  bucket = aws_s3_bucket.aziza-s3-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3-acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.ownership,
    aws_s3_bucket_public_access_block.public-read,
  ]

  bucket = aws_s3_bucket.aziza-s3-bucket.id
  acl    = "public-read"
}



