variable "region" {

  description =  "The AWS region to deploy resources in"
  default =  "us-east-1"
  }

variable "vpc_cidr" {

  description = "The CIDR block for the vpc"
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
 
  description = "The CIDR block for the subnet"
  default = "10.0.1.0/24"
}

variable "allowed_cidr" {

  description = "The CIDR block allowed to access instance"
  default = "0.0.0.0/0"
}

variable "instance_ami" {

  description = "The AMI ID for the instance"
  default = "ami-0806bc468ce3a22ec"
}

variable "instance_type" {

  description = "The type of instance to create"
  default = "t2.micro"
}

