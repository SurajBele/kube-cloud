resource "aws_instance" "iron_man" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    vpc_security_group_ids = [ "aws_security_group.firewall.id "]
    tags = {
      name = var.project
      env = var.env
    }
    
}
resource "aws_security_group" "firewall" {
   vpc_id = aws_vpc.mynetwork.id
    ingress = {
       from_port = 80
       to_port = 80
       protocol = "TCP"
       cidr = ["0.0.0.0/0"]
    }
    ingress {
       from_port        = 22
       to_port          = 22
       protocol         = "TCP"
       cidr_blocks      = ["0.0.0.0/0"]
  }
    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]

   }
    tags = {
      name = var.project
      env = var.env
    }
   
}