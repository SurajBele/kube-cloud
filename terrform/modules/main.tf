terraform {
  backend "s3" {
    bucket = "aditya-1234"
    region = "us-east-1"
  }
}
provider "aws" {
  region = var.aws_region
}
resource "aws_security_group" "firewall" {
  vpc_id = module.myvpc.vpc_id

  # Allow HTTP traffic (port 80) from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH traffic (port 22) from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
      name = var.project
      env = var.env
    }
   
}
module "myvpc" {
  source = "./vpc"
  vpc_cidr = var.vpc_cidr
  pvt_subnet_cidr = var.pvt_subnet_cidr
  pub_subnet_cidr = var.pub_subnet_cidr
  
  project = var.project
  env = var.env
}
module "aws_instance" {
  source = "./instance"
  ami_id = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  sg_id = [aws_security_groups.firewall.id]
  
  project = var.project
  env = var.env
}

