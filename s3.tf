resource "aws_s3_bucket" "ziyotek_bucket" {
  bucket = "abrar3289-bucket"

  tags = {
    Name        = "My bucket "
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {

  bucket = aws_s3_bucket.ziyotek_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_object_lock_configuration" "example432" {
  bucket = aws_s3_bucket.ziyotek_bucket.id
  object_lock_enabled = "Enabled"
  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}


//versioning 

# resource "aws_s3_bucket_versioning" "s3_versioning" {
#   bucket = aws_s3_bucket.ziyotek_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# //Object lock for s3 

# resource "aws_s3_bucket_object_lock_configuration" "ziyotek_bucket" {
#   bucket = aws_s3_bucket.ziyotek_bucket.id

#   rule {
#     default_retention {
#       mode = "COMPLIANCE"
#       days = 5
#     }
#   }
# }


# //encryptions on s3

# resource "aws_kms_key" "mykey" {
#   description             = "This key is used to encrypt bucket objects"
#   deletion_window_in_days = 10
# }
# resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
#   bucket = aws_s3_bucket.ziyotek_bucket.id

#   rule {
#     apply_server_side_encryption_by_default {
#       #kms_master_key_id = aws_kms_key.mykey.arn
#       sse_algorithm = "AES256"
#       #sse_algorithm     = "aws:kms"

#     }
#     bucket_key_enabled = "true"
#   }
# }

# //acl
# resource "aws_s3_bucket_ownership_controls" "ziyotek_bucket" {
#   bucket = aws_s3_bucket.ziyotek_bucket.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "ziyotek_bucket" {
#   bucket = aws_s3_bucket.ziyotek_bucket.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# data "aws_canonical_user_id" "current" {}
# resource "aws_s3_bucket_acl" "ziyotek_bucket" {
#   depends_on = [
#     aws_s3_bucket_ownership_controls.ziyotek_bucket,
#     #aws_s3_bucket_public_access_block.ziyotek_bucket,
#   ]

#   bucket = aws_s3_bucket.ziyotek_bucket.id
#   acl    = "public-read"

# }

