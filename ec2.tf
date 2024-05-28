resource "aws_instance" "web_server1" {
  ami       = data.aws_ami.example.image_id
  subnet_id = aws_subnet.ziyo_subnet_public.id
  vpc_security_group_ids = [
    aws_security_group.ziyo_security_group.id,
  ]
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = "t3.micro"                     #var.instance_type 
  key_name                    = aws_key_pair.deployer.key_name # data.aws_key_pair.example077.key_name
  ebs_optimized               = var.ebs_optimize
  secondary_private_ips       = var.secondary_private_ips
  availability_zone           = var.az
  iam_instance_profile        = aws_iam_instance_profile.test_profile.id
  # user_data = <<EOF
  # sudo yum update -y
  # sudo yum install -y httpd
  # sudo systemctl start httpd.service
  # sudo systemctl enable httpd.service
  # sudo echo "<h1> At $(hostname -f) </h1>" > /var/www/html/index.html
  # EOF 

  user_data = file("efs.sh")
  lifecycle {
    ignore_changes        = [vpc_security_group_ids]
    create_before_destroy = true
    #prevent_destroy = true
  }
}

resource "tls_private_key" "rsa-4096-example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "ziyo-2024-deleteme-michaelrustam07"
  public_key = tls_private_key.rsa-4096-example.public_key_openssh
}

resource "aws_ssm_parameter" "bar" {
  name  = "test_ssh_key_deleteme-michaelrustam07"
  type  = "String"
  value = tls_private_key.rsa-4096-example.private_key_pem
}

