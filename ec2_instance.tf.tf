
#ec2_instance.tf
resource "aws_instance""test_ec2-instance" { 

 ami                      = var.ec2_ami_id   
 instance_type             = var.instance_type 
 subnet_id                  = aws_subnet.test_subnet_public.id 
 key_name                   = var.ec2_key 
 assosiate_public_ip_address =var. assosiate_public_ip_address.truue
 vpc_security_group_ids      = [aws_security_group.test_vpc.id, var.additional_sec_group] 
 ebs_optimized               = var.ebs_optimize
 secondary_private_ips       = [var.secondary_private_ips]
 monitoring                  =var.ec2_monitoring

  tags = var.ec2_tag
} 

   

