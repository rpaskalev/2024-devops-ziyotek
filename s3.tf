resource "aws_s3_bucket" "ziyotek_bucket" {
  bucket = var.s3_bucket_name

  tags = var.s3_tag 

}

//versioning 

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = var.s3_bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}

//Object lock for s3 

resource "aws_s3_bucket_object_lock_configuration" "ziyotek_bucket" {
  bucket = var.s3_bucket_name

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = var.days_retention
    }
  }
}


//encryptions on s3

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = var.s3_bucket_name

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "ziyotek_bucket" {
  bucket = var.s3_bucket_name
  acl    = "public-read"
}

