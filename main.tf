provider "aws" {
  region = var.region
}

# Include all the other .tf files
terraform {
  required_version = ">= 0.12"
}

module "vpc" {
  source = "./vpc"
}

module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_tables" {
  source             = "./route_tables"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.subnets.public_subnet_ids
  internet_gateway_id = module.internet_gateway.internet_gateway_id
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}

module "instances" {
  source            = "./instances"
  public_subnet_id  = module.subnets.public_subnet_ids[0]
  private_subnet_id = module.subnets.private_subnet_ids[0]
  security_group_id = module.security_groups.web_sg_id
  key_name          = var.key_name
}
