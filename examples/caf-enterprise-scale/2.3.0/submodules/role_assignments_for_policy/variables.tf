variable "additional_scope_ids" {
  description = "List of additional scopes IDs for Role Assignments needed for the Policy Assignment. By default, the module will create a Role Assignment at the same scope as the Policy Assignment."
  type        = list(string)
  default     = []
}

variable "policy_assignment_id" {
  description = "Policy Assignment ID."
  type        = string
  default     = null
}

variable "principal_id" {
  description = "Principal ID of the Managed Identity created for the Policy Assignment."
  type        = string
  default     = null
}

variable "role_definition_ids" {
  description = "List of Role Definition IDs for the Policy Assignment. Used to create Role Assignment(s) for the Managed Identity created for the Policy Assignment."
  type        = list(string)
  default     = []
}

variable "scope_id" {
  description = "Scope ID from the Policy Assignment. Depending on the Policy Assignment type, this could be the management_group_id, subscription_id, resource_group_id or resource_id."
  type        = string
  default     = null
}
