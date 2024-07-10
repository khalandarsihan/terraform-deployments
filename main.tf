provider "aws" {
  region = var.region
}

resource "aws_vpc" "my_vpc" {
cidr_block = var.vpc_cidr

tags = {
  Name = "my_vpc"
  }

}


resource "aws_subnet" "my_subnet" {

  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr

tags = {
 Name = "my_subnet"
  }

}


resource "aws_security_group" "allow_http" {

vpc_id = aws_vpc.my_vpc.id
name = "allow_http"
description = "Allow http traffic from ${var.allowed_cidr}"

ingress { 

  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [var.allowed_cidr]
  
}

egress {

  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

}


tags = {

  Name = "allow_http"
 } 

} 


resource "aws_instance" "web-server" {
  ami = var.instance_ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_http.id]

tags = {
  Name = "WebServer-Dev"
}


}



