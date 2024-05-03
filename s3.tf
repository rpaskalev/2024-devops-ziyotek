resource "aws_s3_bucket" "ferdows-test-bucket" {
  bucket        = "ferdows-test-bucket"
  force_destroy = true

  tags = {
    Name  = "ferdows-test-bucket"
    Owner = "ferdows"
  }
}


# bucket ownership
# resource "aws_s3_bucket_ownership_controls" "ownership" {
#   bucket = aws_s3_bucket.ferdows-test-bucket.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# public access 
resource "aws_s3_bucket_public_access_block" "public-access" {
  bucket = aws_s3_bucket.ferdows-test-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# access control 
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    # aws_s3_bucket_ownership_controls.ownership,
    aws_s3_bucket_public_access_block.public-access,
  ]

  bucket = aws_s3_bucket.ferdows-test-bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.ferdows-test-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "my-s3-SSE-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my-bucket-encryption" {
  bucket = aws_s3_bucket.ferdows-test-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.my-s3-SSE-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_object_lock_configuration" "fer-object-lock-config" {
  bucket = aws_s3_bucket.ferdows-test-bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}