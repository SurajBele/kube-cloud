resource "aws_vpc" "mynetwork" {
    cidr_block = "var.vpc_cidr"
    tags = {
      name = var.project
      env = var.env
    }
}
resource "aws_subnet" "pvt_subnet" {
  vpc_id = aws_vpc.mynetwork.id
  cidr_block = var.subnet_cidr 
  tags = {
      name = var.project
      env = var.env
    }
}
resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.mynetwork.id
  cidr_block = var.subnet_cidr 
  tags = {
      name = var.project
      env = var.env
    }
    map_public_ip_on_launch = true
}