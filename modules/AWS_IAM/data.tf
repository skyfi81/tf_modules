# Retrieves the effective Account ID, User ID, and ARN in which Terraform is authorized.
data "aws_caller_identity" "current" {}

# Retrieves the current AWS partition in which Terraform is working. 
data "aws_region" "current" {}

# As well as validating a given region name, this resource can be used to discover the name of the region configured within the provider. 
data "aws_organizations_organization" "current" {}

# Data block for IAM managed policies
data "aws_iam_policy" "managed_policies" {
  for_each = toset(var.managed_policy_names)
  name     = each.key
}

# Data block for existing IAM users
data "aws_iam_user" "existing_user" {
  for_each  = toset(var.existing_iam_users)
  user_name = each.key
}

# Data block for existing OIDC providers
data "aws_iam_openid_connect_provider" "existing_oidc" {
  count = var.enable_identity_provider ? 1 : 0
  url   = var.oidc_url
}