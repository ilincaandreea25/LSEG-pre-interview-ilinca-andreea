output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnets for the VPC"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnets for the VPC"
  value       = module.vpc.private_subnets
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

# output "eks_node_group_arn" {
#   description = "ARN of the EKS node group"
#   value       = module.eks.node_group_arn
# }

output "rds_endpoint" {
  description = "Endpoint for the RDS instance"
  value       = module.rds.endpoint
}
