variable "curve" {
  description = "The curve of the EC key. Required if type is EC or EC-HSM. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM. The API will default to P-256 if nothing is specified."
  type        = string
  default     = null
}

variable "expiration_date" {
  description = "The expiration date of the key as a UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
}

variable "key_vault_resource_id" {
  description = "The ID of the Key Vault where the key should be created."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the key."
  type        = string
  default     = ""
}

variable "not_before_date" {
  description = "key not usable before as a UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
}

variable "opts" {
  description = "The options to apply to the key. Possible values are decrypt, encrypt, sign, wrapKey, unwrapKey, and verify."
  type        = list(string)
  default     = []
}

variable "role_assignments" {
  description = "A map of role assignments to create on the key. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. If you are using a condition, valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "rotation_policy" {
  description = "The rotation policy of the key:\n\n- automatic - The automatic rotation policy of the key.\n  - time_after_creation - The time after creation of the key before it is automatically rotated as an ISO 8601 duration.\n  - time_before_expiry - The time before expiry of the key before it is automatically rotated as an ISO 8601 duration.\n- expire_after - The time after which the key expires.\n- notify_before_expiry - The time before expiry of the key when notification emails will be sent as an ISO 8601 duration.\n"
  type = object({
    automatic = optional(object({
      time_after_creation = optional(string, null)
      time_before_expiry  = optional(string, null)
    }), null)
    expire_after         = optional(string, null)
    notify_before_expiry = optional(string, null)
  })
  default = null
}

variable "size" {
  description = "The size of the RSA key, e.g. 2048 or 4096. Required if type is RSA or RSA-HSM."
  type        = number
  default     = null
}

variable "tags" {
  description = "The tags to assign to the key."
  type        = map(string)
  default     = null
}

variable "type" {
  description = "The type of the key. Possible values are EC, EC-HSM, RSA, and RSA-HSM. The values are case-sensitive. The HSM-backed types (EC-HSM and RSA-HSM) require a Key Vault with the premium SKU, or a Managed HSM."
  type        = string
  default     = ""
}
