resource "aws_instance" "iron_man" {
    ami = "ami-01816d07b1128cd2d"
    key_name = "id_rsa" 
    instance_type = "t2.micro"
    vpc_security_group_ids = aws_security_group.my_sg.id
    availability_zone = "us-east-1a"
    tags = {
      name = "suraj"
      env = "dev"
    }
    
}