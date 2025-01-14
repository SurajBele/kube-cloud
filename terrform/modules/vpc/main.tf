resource "aws_vpc" "mynetwork" {
    cidr_block = "var.vpc_cidr"
    tags = {
      name = "mynetwork"
      env = "dev"
    }
}