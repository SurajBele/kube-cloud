terraform {
  backend "s3" {
    bucket = "aditya-1234"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  
}
resource "aws_instance" "myserver" {
    ami = "ami-01816d07b1128cd2d"
    key_name = "id_rsa" 
    instance_type = "t2.micro"
    vpc_security_group_ids = [ "sg-0d34c3d2b6fa6492a" ]
    availability_zone = "us-east-1a"
    tags = {
      name = "suraj"
      env = "dev"
    }
}

resource "aws_security_group" "my_sg" {
    name = 
}