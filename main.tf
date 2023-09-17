provider "aws" {
  region = var.region
}

module "nakos-vpc-example" {
  source = "./vpc-module"  # This should point to the directory containing your module

  region               = var.region
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_1_name = var.public_subnet_1_name
  public_subnet_2_cidr = var.public_subnet_2_cidr
  public_subnet_2_name = var.public_subnet_2_name
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_1_name = var.private_subnet_1_name
  private_subnet_2_cidr = var.private_subnet_2_cidr
  private_subnet_2_name = var.private_subnet_2_name
  availability_zones   = var.availability_zones
}
