resource "aws_instance" "ec2user88" {
  ami           = "ami-0bb84b8ffd87024d8" 
  instance_type = "t2.micro"             

  # Enable detailed monitoring
  monitoring = true

 
  tags = {
    Name        = "ec2user88"
    Environment = "Development"
   
  }

  
  ebs_optimized = true

  # Define a block device mapping for an EBS volume (optional)
  root_block_device {
    volume_type = "gp2"
    volume_size = 30
  }

 
  
}

