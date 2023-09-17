provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_1_name
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_2_name
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_1_cidr
  availability_zone       = var.availability_zones[0]

  tags = {
    Name = var.private_subnet_1_name
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_2_cidr
  availability_zone       = var.availability_zones[1]

  tags = {
    Name = var.private_subnet_2_name
  }
}

# Create internet gateway and associate with VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.vpc_name
  }
}

# Attach route table to public subnets
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_vpc.main.main_route_table_id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_vpc.main.main_route_table_id
}

# Create a new route table for private subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-route-table"
  }
}

# Add a default route to the NAT Gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat.id
}

# Create a NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "nat-gateway"
  }
}

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
  vpc = true
}

# Create a VPC endpoint for S3
resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.s3"
  route_table_ids     = [aws_vpc.main.main_route_table_id]
}

# Associate private route table with private subnets
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private.id
}

# Output
output "vpc_id" {
  value = aws_vpc.main.id
}
