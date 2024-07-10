provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web-server" {
  ami = "ami-0821e601b0426ccf5"
  instance_type = "t2.micro"

tags = {
  Name = "WebServer-Dev"
}

}
