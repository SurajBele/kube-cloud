terraform {
  backend "s3" {
    bucket = "aws-module-bucket"
    region = var.aws_region
  }
}
provider "aws" {
  region = var.aws_region
}

module "aws_instance" {
  source = "instance"
  ami_id = var.ami_id
  key_name = var.key_name
  instance_type = var.
}
