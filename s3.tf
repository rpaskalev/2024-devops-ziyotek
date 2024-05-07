resource "aws_s3_bucket" "Ziyotek-s3" {
  bucket = "aziza-bucket"
   
}
resource "aws_s3_bucket_versioning" "versioning_Ziyotek-s3" {
  bucket = aws_s3_bucket.Ziyotek-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}  
