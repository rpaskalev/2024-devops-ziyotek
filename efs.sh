#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo mkdir /var/www/html/static
sudo echo "</h1> YOU HAVE REACHED THE STATIC PAGE </h1>" > /var/www/html/static/index.html