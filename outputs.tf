output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.vpc.id  
}

output "private1_subnet_id" {
  description = "IDs of the private subnet1"
  value = aws_subnet.private1_subnet.id
}

output "private2_subnet_id" {
  description = "IDs of the private subnet2"
  value = aws_subnet.private2_subnet.id
}

output "public1_subnet_id" {
  description = "IDs of the public subnet1"
  value = aws_subnet.public1_subnet.id
}

output "public2_subnet_id" {
  description = "IDs of the public subnet2"
  value = aws_subnet.public2_subnet.id
}

output "repository_url" {
  value = aws_ecr_repository.my_repository.repository_url
}