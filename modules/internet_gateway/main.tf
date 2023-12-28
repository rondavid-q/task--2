variable "vpc_id" {
  type = string
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = var.vpc_id
}

output "igw_id" {
  value = aws_internet_gateway.my_igw.id
}
