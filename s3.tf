resource "aws_s3_bucket" "ziyotek_bucket" {
  bucket = var.ziyotek_bucket

  tags = var.bucket_tags
}

//versioning 

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.ziyotek_bucket.id
  versioning_configuration {
    status = var.version_status
  }
}

//Object lock for s3 

resource "aws_s3_bucket_object_lock_configuration" "ziyotek_bucket" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  rule {
    default_retention {
      mode = var.bucket_object_lock_mode
      days = var.bucket_object_lock_days
    }
  }
}


//encryptions on s3

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.encryption
    }
  }
}

resource "aws_s3_bucket_acl" "ziyotek_bucket" {
  bucket = aws_s3_bucket.ziyotek_bucket.id
  acl    = var.acl_type

  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  block_public_acls       = var.example_public_acls
  block_public_policy     = var.example_public_policy
  ignore_public_acls      = var.example_ignore_public_acls
  restrict_public_buckets = var.example_restrict_public_buckets
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  rule {
    object_ownership = var.obj_ownership
  }
}
