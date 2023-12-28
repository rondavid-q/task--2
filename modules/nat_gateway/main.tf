# modules/nat_gateway/main.tf

variable "subnet_id" {
  type = string
}

variable "igw_id" {
  type = string
}

variable "ec2_instance_allocation_id" {
  type = string
}

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = var.ec2_instance_allocation_id
  subnet_id     = var.subnet_id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.my_nat_gateway.id
}
