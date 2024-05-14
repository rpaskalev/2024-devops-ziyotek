resource "aws_security_group" "allow_this" {  
 name        = "allow_this"  
description = "Allow TLS inbound traffic and all outbound traffic"  

 vpc_id      = aws_vpc.ziyo_vpc.id  

tags = {  

  Name = "allow_this"  
}  

}  

  resource "aws_vpc_security_group_ingress_rule" "allow_this_ipv4" {  
  security_group_id = aws_security_group.allow_this.id  
  cidr_ipv4         = aws_vpc.ziyo_vpc.cidr_block  

 from_port         = 0                                       
 ip_protocol       = "-1"  

 to_port           = 0  

}  
 resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {  

security_group_id = aws_security_group.allow_this.id  

cidr_ipv4         = "0.0.0.0/0"  

ip_protocol       = "-1" # semantically equivalent to all ports  

}  