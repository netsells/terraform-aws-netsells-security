output "role_ops_arn" {
  value = aws_iam_role.NetsellsSecurityOps.arn
}

output "role_engineer_arn" {
  value = aws_iam_role.NetsellsSecurityEngineer.arn
}

output "role_readonly_arn" {
  value = aws_iam_role.NetsellsSecurityReadOnly.arn
}
