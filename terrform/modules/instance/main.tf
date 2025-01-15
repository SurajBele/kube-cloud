resource "aws_instance" "iron_man" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    tags = {
      name = var.project
      env = var.env
    }
    
}
