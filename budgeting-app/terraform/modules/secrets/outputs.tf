output "secret_arn" {
  description = "ARN of the created secret"
  value       = aws_secretsmanager_secret.db_credentials.arn
}

output "secret_id" {
  description = "ID of the created secret"
  value       = aws_secretsmanager_secret.db_credentials.id
}
