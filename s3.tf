resource "aws_s3_bucket" "ziyotek_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_tag.name
    Environment = var.bucket_tag.environment
  }
}

//versioning 

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.ziyotek_bucket.id
  versioning_configuration {
    status = var.status
  }
}

//Object lock for s3 

resource "aws_s3_bucket_object_lock_configuration" "ziyotek_bucket" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  rule {
    default_retention {
      mode = var.retentation_mode
      days = var.retentation_days
    }
  }
}


//encryptions on s3

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_acl" "ziyotek_bucket" {
  bucket = aws_s3_bucket.ziyotek_bucket.id
  acl    = var.acl
}

