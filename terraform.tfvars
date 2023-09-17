# Use the preconfigured values or customize them as needed
region               = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
vpc_name             = "my-vpc"
public_subnet_1_cidr = "10.0.1.0/24"
public_subnet_1_name = "public-subnet-1"
public_subnet_2_cidr = "10.0.2.0/24"
public_subnet_2_name = "public-subnet-2"
private_subnet_1_cidr = "10.0.3.0/24"
private_subnet_1_name = "private-subnet-1"
private_subnet_2_cidr = "10.0.4.0/24"
private_subnet_2_name = "private-subnet-2"
availability_zones   = ["us-east-1a", "us-east-1b"]

# If you have an existing NAT Gateway, provide its ID. Otherwise, leave it empty.
nat_gateway_id       = ""
