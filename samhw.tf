resource "aws_s3_bucket" "zadah_state_bucket" {
  bucket = "zadah-state-bucket"

  tags = {
    Name        = "Zadah State"
    Environment = "State"
  }
}

resource "aws_s3_bucket" "zadah_bucket_remote" {
  bucket = "zadah-remote-bucket"

  tags = {
    Name        = "Zadah Remote"
    Environment = "Remote"
  }
}


resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.zadah_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}



resource "aws_s3_bucket_object_lock_configuration" "zadah-state-bucket" {
  bucket = aws_s3_bucket.zadah_state_bucket.id

  
 rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.zadah_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "zadah-state-bucket" {
  bucket = aws_s3_bucket.zadah_state_bucket.id
  acl    = "public-read"
}
