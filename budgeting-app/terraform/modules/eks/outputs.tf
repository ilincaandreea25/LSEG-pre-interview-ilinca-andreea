output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks.name
}

output "node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = aws_eks_node_group.node_group.arn
}