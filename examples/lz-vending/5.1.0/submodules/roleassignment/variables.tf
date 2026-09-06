variable "role_assignment_condition" {
  description = "(Optional) The condition that limits the resources that the role can be assigned to.\n"
  type        = string
  default     = null
}

variable "role_assignment_condition_version" {
  description = "The version of the condition. Possible values are null, 1.0 or 2.0. If null then role_assignment_condition will also be null.\n"
  type        = string
  default     = null
}

variable "role_assignment_definition" {
  description = "Either the role definition resource id, e.g. /subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c.\nOr, the role definition name, e.g. Contributor.\n"
  type        = string
  default     = ""
}

variable "role_assignment_definition_lookup_enabled" {
  description = "Whether to look up the role definition resource id from the role definition name.\nIf disabled, the role_assignment_definition must be a role definition resource id.\n"
  type        = bool
  default     = true
}

variable "role_assignment_principal_id" {
  description = "The principal (object) ID of the role assignment.\nNote, for a service principal, this is not the application id.\n\nCan be user, group or service principal.\n"
  type        = string
  default     = ""
}

variable "role_assignment_principal_type" {
  description = "Required when using attribute based access control (ABAC).\nThe type of principal. Can be User, Group, ServicePrincipal, Device, or ForeignGroup.\n"
  type        = string
  default     = null
}

variable "role_assignment_scope" {
  description = "The scope of the role assignment.\n\nMust begin with /subscriptions/{subscription-id} to avoid accidentally creating a role assignment at higher scopes.\n"
  type        = string
  default     = ""
}
