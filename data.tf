 data "aws_s3_bucket" "selected" {
  bucket = "s3-bucketby-aws"
}


output name {
  value =  data.aws_s3_bucket.selected.arn
}
 

