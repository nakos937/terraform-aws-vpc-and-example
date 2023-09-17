variable "region" {
  description = "The AWS region where the VPC will be created."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1."
  type        = string
}

variable "public_subnet_1_name" {
  description = "Name of public subnet 1."
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2."
  type        = string
}

variable "public_subnet_2_name" {
  description = "Name of public subnet 2."
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1."
  type        = string
}

variable "private_subnet_1_name" {
  description = "Name of private subnet 1."
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2."
  type        = string
}

variable "private_subnet_2_name" {
  description = "Name of private subnet 2."
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets."
  type        = list(string)
}
