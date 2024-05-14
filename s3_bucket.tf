
resource "aws_s3_bucket" "test_bucket" { 

  bucket            = var.s3_bucket_name

  tags               = var.s3_tag
 
  Name                = "test-bucket" 

  Environment          = "test" 

  } 
  