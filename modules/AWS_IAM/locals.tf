locals {
  account_id      = data.aws_caller_identity.current.account_id
  region          = data.aws_region.current.name
  organization_id = data.aws_organizations_organization.current.id
}