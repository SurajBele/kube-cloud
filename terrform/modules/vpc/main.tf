resource "aws_vpc" "mynetwork" {
    cidr_block = "var.vpc_cidr"
    tags = {
      name = var.project
      env = var.env
    }
}
resource "" "name" {
  
}