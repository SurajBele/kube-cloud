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
resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.mynetwork.id
    tags = {
      name = var.project
      env = var.env
    }

}
resource "aws_route_table" "myroute" {
    vpc_id = aws_vpc.mynetwork.id
    tags = {
      name = var.project
      env = var.env
    }
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}
resource "aws_route_table_association" "route_subnet" {
    subnet_id = aws_subnet.pub_subnet.id
    route_table_id = aws_route_table.myroute.id
    
}
resource "aws_security_group" "firewall" {
   vpc_id = aws_vpc.mynetwork.id
   
}