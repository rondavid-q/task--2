# modules/ec2_instance/main.tf

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair_name" {
  type = string
}

resource "aws_instance" "my_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  key_name        = var.key_pair_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "MyInstance"
  }
}

data "aws_instance" "my_instance_data" {
  instance_id = aws_instance.my_instance.id
}

output "instance_id" {
  value = aws_instance.my_instance.id
}

output "allocation_id" {
  value = data.aws_instance.my_instance_data.network_interface_ids[0]
}
