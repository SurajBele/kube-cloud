resource "aws_instance" "iron_man" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = "t2.micro"
    vpc_security_group_ids = aws_security_group.my_sg.id
    availability_zone = "us-east-1a"
    tags = {
      name = "suraj"
      env = "dev"
    }
    
}