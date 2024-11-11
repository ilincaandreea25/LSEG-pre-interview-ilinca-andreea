output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

# output "node_group_arn" {
#   description = "The ARN of the EKS node group"
#   value       = module.eks.eks_managed_node_groups.node_group_arn
# }