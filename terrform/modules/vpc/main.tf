resource "aws_vpc" "mynetwork" {
    cidr_block = "var.vpc_cidr"
    tags = {
      name = var.project
      env = var.env
    }
}
resource "aws_subnet" "pvt_subnet" {
  vpc_id = aws_vpc.mynetwork.id
  
}