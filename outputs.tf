output "vpc_main_route_table_id" {
  value = aws_vpc.tory_vpc.main_route_table_id 
}

output "s3_region" {
    value = aws_s3_bucket.sitoras3bucket.region 
}