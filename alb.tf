resource "aws_launch_configuration" "ziyo_lc" {
  name                        = "web_tier"
  image_id                    = data.aws_ami.example.image_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups = [
    aws_security_group.ziyo_security_group.id,
  ]
  user_data = file("efs.sh")
  key_name  = data.aws_key_pair.example.key_name
}

resource "aws_autoscaling_group" "bar" {
  name                 = "web_tier_asg"
  max_size             = 3
  min_size             = 1
  desired_capacity     = 1
  force_delete         = false
  launch_configuration = aws_launch_configuration.ziyo_lc.name
  vpc_zone_identifier  = [aws_subnet.ziyo_subnet_public.id]
}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-tier-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ziyo_vpc.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "traffic-port"
    matcher             = "200-300"
  }
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "web_attach" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  lb_target_group_arn    = aws_lb_target_group.web_tg.arn
}