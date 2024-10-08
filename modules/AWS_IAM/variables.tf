variable "iam_users" {
  description = "List of IAM users to create"
  type        = list(string)
  default     = []
}

variable "iam_user_access_key_status" {
  description = "Whether to make IAM User Access Key Active or Inactive"
  type        = string
  default     = "Active"
}

variable "enable_iam_user_access_key" {
  description = "Whether to create an IAM User Access Key for IAM User"
  type        = bool
  default     = false
}

variable "iam_user_path" {
  description = "Path for IAM users"
  type        = string
  default     = "/"
}

variable "iam_user_force_destroy" {
  description = "Whether to force destroy IAM users"
  type        = bool
  default     = false
}

variable "iam_groups" {
  description = "List of IAM groups to create"
  type        = list(string)
  default     = []
}

variable "iam_group_path" {
  description = "Path for IAM groups"
  type        = string
  default     = "/"
}

variable "iam_roles" {
  description = "List of IAM roles to create with assume role policy"
  type = list(object({
    name                 = string
    assume_role_policy   = string
    max_session_duration = optional(number, 3600)
    permissions_boundary = optional(string, null)
    tags                 = optional(map(string), {})
  }))
  default = []
}

variable "iam_role_path" {
  description = "Path for IAM roles"
  type        = string
  default     = "/"
}

variable "iam_policies" {
  description = "List of IAM policies to create"
  type = list(object({
    name        = string
    policy      = string
    description = optional(string, "Managed policy for IAM resources.")
  }))
  default = []
}

variable "iam_policy_path" {
  description = "Path for IAM policies"
  type        = string
  default     = "/"
}

variable "role_policy_attachments" {
  description = "List of role to policy attachments"
  type = list(object({
    role_name  = string
    policy_arn = string
  }))
  default = []
}

variable "enable_access_analyzer" {
  description = "Enable IAM Access Analyzer"
  type        = bool
  default     = false
}

variable "access_analyzer_name" {
  description = "Name of the Access Analyzer"
  type        = string
  default     = "example-analyzer"
}

variable "enable_access_analyzer_archive_rule" {
  description = "Enable IAM Access Analyzer Archive Rule"
  type        = bool
  default     = false
}

variable "access_analyzer_archive_rules" {
  description = "List of archive rules for Access Analyzer"
  type = list(object({
    rule_name = string
    filter = object({
      property = string
      eq       = optional(list(string))
      neq      = optional(list(string))
      contains = optional(list(string))
      exists   = optional(bool)
    })
  }))
  default = []
}

variable "enable_identity_provider" {
  description = "Enable Identity Provider"
  type        = bool
  default     = false
}

variable "oidc_client_id_list" {
  description = "List of client IDs for the OIDC identity provider"
  type        = list(string)
  default     = []
}

variable "oidc_url" {
  description = "URL of the OIDC identity provider"
  type        = string
  default     = ""
}

variable "oidc_thumbprint_list" {
  description = "List of thumbprints for the OIDC identity provider"
  type        = list(string)
  default     = []
}

variable "managed_policy_names" {
  description = "List of AWS managed IAM policy names to reference"
  type        = list(string)
  default     = ["AdministratorAccess", "ReadOnlyAccess"]
}

variable "existing_iam_users" {
  description = "List of existing IAM users to reference"
  type        = list(string)
  default     = []
}

variable "environment" {
  description = "Environment tag for resources"
  type        = string
  default     = "development"
}

variable "project_name" {
  description = "Project name for tagging purposes"
  type        = string
  default     = "example-project"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to a resource"
  default     = {}
}