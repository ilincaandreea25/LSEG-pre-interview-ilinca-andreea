variable "db_user" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}

variable "vpc_id" {
  description = "The VPC ID for RDS"
}

variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}
