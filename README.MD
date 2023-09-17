## This Terraform project deploys anA VPC with 2 private and public subnets in 2 AZ-s and a VPC endpoint for Amazon S3.

# Features:

    Creates a customizable VPC with best practices for multi-AZ redundancy.
    Configures public subnets designed for hosting load balancers or reverse proxies.
    Establishes private subnets for application servers with controlled internet access.
    Implements a NAT Gateway for outbound internet access from private subnets.
    Sets up a VPC endpoint for Amazon S3, allowing secure and efficient access without public internet routing.

# Usage:

    1. Clone this repository.
    2. Customize the terraform.tfvars file with your desired parameters.
    3. Run terraform init and terraform apply to deploy the infrastructure.
