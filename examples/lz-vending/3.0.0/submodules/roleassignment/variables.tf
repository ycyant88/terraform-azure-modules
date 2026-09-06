variable "role_assignment_definition" {
  description = "Either the role definition resource id, e.g. /subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c.\nOr, the role definition name, e.g. Contributor.\n"
  type        = string
  default     = ""
}

variable "role_assignment_principal_id" {
  description = "The principal (object) ID of the role assignment.\nNote, for a service principal, this is not the application id.\n\nCan be user, group or service principal.\n"
  type        = string
  default     = ""
}

variable "role_assignment_scope" {
  description = "The scope of the role assignment.\n\nMust begin with /subscriptions/{subscription-id} to avoid accidentally creating a role assignment at higher scopes.\n"
  type        = string
  default     = ""
}
