data "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = module.db_secrets.secret_id
  depends_on = [module.db_secrets]
}
