terraform {
  backend "s3" {
    bucket = "aws-module-bucket"
    region = "us-east-1"
  }
}
provider "aws" {
  region = var.aws_region
}
