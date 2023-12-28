# VPC Module Variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnet Module Variables
variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# EC2 Instance Module Variables
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-077885f59ecb77b84" 
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.medium"  
}

variable "key_pair_name" {
  description = "Name of the key pair for the EC2 instance"
  type        = string
  default     = "task-2"  # Specify your key pair name
}
