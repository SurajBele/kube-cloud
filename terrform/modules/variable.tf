variable "aws_region" {
  default = "us-east-1"
}
variable "ami_id" {
    default = "ami-01816d07b1128cd2d"
}
variable "key_name" {
    default = "id_rsa"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "project" {}
variable "env" {}