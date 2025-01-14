terraform {
  backend "s3" {
    bucket = "aws-module-bucket"
    region = "us-east-1"
  }
}