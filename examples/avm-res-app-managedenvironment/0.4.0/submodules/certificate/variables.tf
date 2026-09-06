variable "certificate_password" {
  description = "The password for the certificate (WriteOnly). Required when using direct certificate upload."
  type        = string
  default     = null
}

variable "certificate_value" {
  description = "The PFX or PEM blob for the certificate (WriteOnly). Required when using direct certificate upload."
  type        = string
  default     = null
}

variable "key_vault_identity" {
  description = "Resource ID of a managed identity to authenticate with Azure Key Vault, or 'System' to use a system-assigned identity. Required when using Key Vault reference."
  type        = string
  default     = null
}

variable "key_vault_url" {
  description = "URL pointing to the Azure Key Vault secret that holds the certificate. Required when using Key Vault reference."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where the certificate resource should be created."
  type        = string
  default     = ""
}

variable "managed_environment" {
  description = "The managed environment resource."
  type = object({
    resource_id = string
  })
  default = ""
}

variable "name" {
  description = "The name of the certificate resource."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = " - create - (Defaults to 30 minutes) Used when creating the certificate.\n - delete - (Defaults to 30 minutes) Used when deleting the certificate.\n - read - (Defaults to 5 minutes) Used when retrieving the certificate.\n - update - (Defaults to 30 minutes) Used when updating the certificate.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
