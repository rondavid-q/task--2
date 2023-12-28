variable "vpc_id" {
  type = string
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1b"  
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"  
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
