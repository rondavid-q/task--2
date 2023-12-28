# modules/nat_gateway/main.tf

variable "subnet_id" {
  type = string
}

variable "igw_id" {
  type = string
}

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_instance.my_instance.network_interface_ids[0]
  subnet_id     = var.subnet_id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.my_nat_gateway.id
}
