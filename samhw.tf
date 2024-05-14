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

