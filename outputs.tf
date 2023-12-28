# VPC Module Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

# Subnet Module Outputs
output "private_subnet_id" {
  value = module.subnet.private_subnet_id
}

# Internet Gateway Module Outputs
output "igw_id" {
  value = module.internet_gateway.igw_id
}

# Security Group Module Outputs
output "sg_id" {
  value = module.security_group.sg_id
}

# Route Table Module Outputs
output "public_route_table_id" {
  value = module.route_table.public_route_table_id
}

output "private_route_table_id" {
  value = module.route_table.private_route_table_id
}

# NAT Gateway Module Outputs
output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}

# EC2 Instance Module Outputs
output "instance_id" {
  value = module.ec2_instance.instance_id
}
