terraform {
  backend "s3" {
    bucket = "aditya-1234"
    region = "us-east-1"
  }
}
provider "aws" {
  region = var.aws_region
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
  subnet_id = module.my_vpc.pub_subnet_id
  project = var.project
  env = var.env
}

