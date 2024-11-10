variable "vpc_id" {
  description = "The VPC ID for RDS"
}

variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}

variable "db_user" {
  description = "Username for the RDS instance"
}

variable "db_password" {
  description = "Password for the RDS instance"
  sensitive   = true
}

variable "db_name" {
  description = "Database name for the RDS instance"
}
