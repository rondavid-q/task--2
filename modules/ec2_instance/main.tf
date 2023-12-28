
variable "subnet_id" {
  type = string
}

variable "sg_id" {
  type = string
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
  security_group  = [var.sg_id]

  tags = {
    Name = "task-2-instance"
  }
}

output "instance_id" {
  value = aws_instance.my_instance.id
}
