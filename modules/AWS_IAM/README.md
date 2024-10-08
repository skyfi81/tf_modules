## Example Usage

```hcl
module "aws_iam" {
  source = "git::https://github.com/yourrepo/modules/aws_iam.git"

  iam_users = [
    "user1",
    "user2"
  ]

  iam_groups = [
    "group1"
  ]

  iam_roles = [
    {
      name               = "role1"
      assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
          {
            Effect    = "Allow",
            Principal = {
              Service = "ec2.amazonaws.com"
            },
            Action = "sts:AssumeRole"
          }
        ]
      })
      max_session_duration = 7200
      tags = merge({ "Name" = "${var.name}-role" }, var.tags)
    }
  ]

  iam_policies = [
    {
      name   = "policy1",
      policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
          {
            Action   = ["s3:*"]
            Effect   = "Allow"
            Resource = "*"
          }
        ]
      })
      description = "Policy for S3 access"
    }
  ]

  role_policy_attachments = [
    {
      role_name  = "role1"
      policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    }
  ]

  enable_access_analyzer = true
  access_analyzer_name   = "my-access-analyzer"
  access_analyzer_tags   = {
    Environment = "prod"
  }

  enable_identity_provider = true
  oidc_client_id_list      = ["sts.amazonaws.com"]
  oidc_url                 = "https://oidc.eks.region.amazonaws.com/id/EXAMPLE"
  oidc_thumbprint_list     = ["9e99a48a9960a6b97a0ee203bfd64"]

  enable_iam_user_access_key = true
  iam_user_access_key_status = "Active"
}
```