variable "region" {
  description = "The AWS region where the VPC will be created."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "my-vpc"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1."
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_1_name" {
  description = "Name of public subnet 1."
  type        = string
  default     = "public-subnet-1"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2."
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_2_name" {
  description = "Name of public subnet 2."
  type        = string
  default     = "public-subnet-2"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1."
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_1_name" {
  description = "Name of private subnet 1."
  type        = string
  default     = "private-subnet-1"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2."
  type        = string
  default     = "10.0.4.0/24"
}

variable "private_subnet_2_name" {
  description = "Name of private subnet 2."
  type        = string
  default     = "private-subnet-2"
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "nat_gateway_id" {
  description = "ID of the existing NAT Gateway (if any)."
  type        = string
  default     = "" # Provide the actual ID if you have an existing NAT Gateway, otherwise leave it empty.
}
