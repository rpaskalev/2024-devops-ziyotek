#Creating bucket

resource "aws_s3_bucket" "damir-2024-bucket" {
  bucket = "damir-2024-bucket"
 

  tags = {
    Name = "S3 Bucket"
    Environment = "Devops"
  }
}

#Versioning

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.damir-2024-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


#Encryptions

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.damir-2024-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

#object lock
resource "aws_s3_bucket_object_lock_configuration" "object-lock" {
  bucket = aws_s3_bucket.damir-2024-bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}

#public-read ACL
resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.damir-2024-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public-access" {
  bucket = aws_s3_bucket.damir-2024-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.owner,
    aws_s3_bucket_public_access_block.public-access,
  ]

  bucket = aws_s3_bucket.damir-2024-bucket.id
  acl    = "public-read"
}