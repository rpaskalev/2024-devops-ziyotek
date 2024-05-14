resource "aws_instance" "web_server1" {
  ami                         = var.ami_id
  subnet_id                   = aws_subnet.ziyo_subnet_public.id
  vpc_security_group_ids      = [aws_security_group.ziyo_security_group.id]
  associate_public_ip_address = var.associate_public
  instance_type               = var.instance_type
  #key_name                    = "ferro-key.pem"
  monitoring = var.ec2_monitoring
  //ebs_optimized = var.ebs_optimized
  tags = var.ec2_tags
}  
//Cloudwatch Alarm
# resource "aws_cloudwatch_metric_alarm" "web_monitor" {
#   alarm_name = "terraform-test-foobar5"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods = "CPUUtilization"
#   namespace = "AWS/EC2"
#   period = 120
#   statistic = "Average"
#   threshold = 80
#   alarm_description = "This metric monitors ec2 cpu utilization"
# }