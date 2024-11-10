variable "vpc_id" {
  description = "The VPC ID where the EKS cluster and worker nodes will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS node group"
  type        = list(string)
}

variable "ssh_key_name" {
  description = "Optional SSH key name for accessing the worker nodes"
  type        = string
  default     = ""
}