provider "aws" {
  region = var.region
}

# VPC Module
module "vpc" {
  source    = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

# EKS Module
module "eks" {
  source     = "./modules/eks"
  subnet_ids = module.vpc.public_subnets
}

# RDS Module
module "rds" {
  source      = "./modules/rds"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets
  db_user     = var.db_user
  db_password = var.db_password
  db_name     = var.db_name
}
