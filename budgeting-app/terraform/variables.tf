variable "region" {
  description = "AWS region to deploy to"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "ssh_key_name" {
  description = "SSH key name for accessing the worker nodes"
  type        = string
  default     = "ilinca"  # Replace with your SSH key name
}