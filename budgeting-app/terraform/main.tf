terraform {
  required_version = "1.6.5"
}

provider "aws" {
  region = var.region
}

# VPC Module
module "vpc" {
  source    = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

# Secrets Module for Database Credentials
module "db_secrets" {
  source      = "./modules/secrets"
  secret_name = "db_credentials"
  db_user     = var.db_user
  db_password = var.db_password
}

# EKS Module
module "eks" {
  source     = "./modules/eks"
  subnet_ids = module.vpc.public_subnets
}

# RDS Module with reference to Secrets Manager
module "rds" {
  source        = "./modules/rds"
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnets
  db_user       = jsondecode(data.aws_secretsmanager_secret_version.db_credentials.secret_string)["username"]
  db_password   = jsondecode(data.aws_secretsmanager_secret_version.db_credentials.secret_string)["password"]
}
