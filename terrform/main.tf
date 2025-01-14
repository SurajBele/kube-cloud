# terraform {
#   backend "s3" {
#     bucket = "aditya-1234"
#     region = "us-east-1"
#   }
# }

# provider "aws" {
#   region = "us-east-1"
  
# }
# resource "aws_instance" "myserver" {
#     ami = "ami-01816d07b1128cd2d"
#     key_name = "id_rsa" 
#     instance_type = "t2.micro"
#     vpc_security_group_ids = aws_security_group.my_sg.id
#     availability_zone = "us-east-1a"
#     tags = {
#       name = "suraj"
#       env = "dev"
#     }
    
# }

# resource "aws_security_group" "my_sg" {
#     name = "my_sg"
#     vpc_id = aws_vpc.mynetwork.id
#     ingress = {
#         protocol = "TCP"
#         from_port = 80
#         to_port =  80
#         cidr = var.sg_cidr

#     }
        
# }
# resource "aws_vpc" "mynetwork" {
#     cidr_block = var.vpc_cidr_block
#     tags = {
#       name = "mynetwork"
#       env = "dev"
#     }
# }

# data "aws_security_groups" "mysg" {
#   filter {
#    name = "vpc_id" 
#    values = aws_vpc.id 
#    } 
#   filter {
#     name = "group-name"
#     values = [ my_sg ]
#   }
# }

