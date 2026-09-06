variable "content_type" {
  description = "The content type of the secret."
  type        = string
  default     = null
}

variable "expiration_date" {
  description = "The expiration date of the secret as a UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
}

variable "key_vault_resource_id" {
  description = "The ID of the Key Vault where the secret should be created."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the secret."
  type        = string
  default     = ""
}

variable "not_before_date" {
  description = "Secret not usable before as a UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
}

variable "role_assignments" {
  description = "A map of role assignments to create on the secret. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. If you are using a condition, valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "tags" {
  description = "The tags to assign to the secret."
  type        = map(string)
  default     = null
}

variable "value" {
  description = "The value for the secret."
  type        = string
  default     = ""
}
