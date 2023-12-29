# Terraform AWS VPC Setup

This Terraform script provisions an AWS VPC with public and private subnets. It includes the creation of an Internet Gateway for public subnet access and a NAT Gateway for private subnet internet access.

## Prerequisites

Before running this Terraform script, make sure you have the following prerequisites:

- [Terraform](https://www.terraform.io/) installed on your machine.
- AWS credentials configured with the necessary permissions.

## Configuration

Update the `variables.tf` file to customize the VPC and subnet configurations according to your requirements.

## Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/rondavid-q/task-2-infra.git
   cd task-2-infra

   terraform init
   terraform plan
   terraform apply

Once everything is done, destroy the cerated resources using terraform destroy

2. This folder also has Jenkinsfile, which can be used with jenkins to automate the entire process along with the choice to give your own set of variables.

The jenkins file also has the flexibility to create and destroy resources.