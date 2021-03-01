output "db-host" {
  value = aws_db_instance.ghost.address
}

output "db-name" {
  value = aws_db_instance.ghost.name
}

output "db-user" {
  value = var.db_user
}

output "db-pass" {
  value = var.db_pass
}

