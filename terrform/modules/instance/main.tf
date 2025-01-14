resource "aws_instance" "iron_man" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    vpc_security_group_ids = aws_security_group.my_sg.id
    availability_zone = "us-east-1a"
    tags = {
      name = "suraj"
      env = "dev"
    }
    
}