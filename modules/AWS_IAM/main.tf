# Create IAM Users, Groups, Roles, Policies, and Access Analyzer
resource "aws_iam_user" "main" {
  count         = length(var.iam_users)
  name          = var.iam_users[count.index]
  path          = var.iam_user_path
  force_destroy = var.iam_user_force_destroy
  tags          = var.tags
}

resource "aws_iam_access_key" "main" {
  count  = var.enable_iam_user_access_key ? length(var.iam_users) : 0
  user   = aws_iam_user.main[count.index].name
  status = var.iam_user_access_key_status
}

resource "aws_iam_group" "main" {
  count = length(var.iam_groups)
  name  = var.iam_groups[count.index]
  path  = var.iam_group_path
}

resource "aws_iam_role" "main" {
  count                = length(var.iam_roles)
  name                 = var.iam_roles[count.index].name
  assume_role_policy   = var.iam_roles[count.index].assume_role_policy
  path                 = var.iam_role_path
  max_session_duration = var.iam_roles[count.index].max_session_duration
  permissions_boundary = var.iam_roles[count.index].permissions_boundary
  tags                 = var.iam_roles[count.index].tags
}

resource "aws_iam_policy" "main" {
  count       = length(var.iam_policies)
  name        = var.iam_policies[count.index].name
  policy      = var.iam_policies[count.index].policy
  path        = var.iam_policy_path
  description = var.iam_policies[count.index].description
}

resource "aws_iam_role_policy_attachment" "main" {
  count      = length(var.role_policy_attachments)
  role       = var.role_policy_attachments[count.index].role_name
  policy_arn = var.role_policy_attachments[count.index].policy_arn
}

# Identity Provider
resource "aws_iam_openid_connect_provider" "oidc_provider" {
  count           = var.enable_identity_provider ? 1 : 0
  client_id_list  = var.oidc_client_id_list
  url             = var.oidc_url
  thumbprint_list = var.oidc_thumbprint_list
  tags            = var.tags
}

# Access Analyzer
resource "aws_accessanalyzer_analyzer" "access_analyzer" {
  count         = var.enable_access_analyzer ? 1 : 0
  analyzer_name = var.access_analyzer_name
  type          = "ACCOUNT"
  tags          = var.tags
}
