output "iam_user_names" {
  description = "List of IAM user names"
  value       = aws_iam_user.example_user[*].name
}

output "iam_group_names" {
  description = "List of IAM group names"
  value       = aws_iam_group.example_group[*].name
}

output "iam_role_names" {
  description = "List of IAM role names"
  value       = aws_iam_role.example_role[*].name
}

output "access_analyzer_name" {
  description = "Name of the Access Analyzer"
  value       = length(aws_accessanalyzer_analyzer.access_analyzer) > 0 ? aws_accessanalyzer_analyzer.access_analyzer[0].name : null
}

output "oidc_provider_arn" {
  description = "ARN of OIDC Provider"
  value       = aws_iam_openid_connect_provider.oidc_provider.arn
}