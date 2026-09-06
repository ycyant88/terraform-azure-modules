variable "host_names" {
  description = "(Optional) The host names the certificate applies to. If omitted, Azure derives them from the certificate's subject alternative names."
  type        = list(string)
  default     = null
}

variable "key_vault_id" {
  description = "(Optional) The resource ID of the Key Vault that contains the certificate.\n\nEither both key_vault_id and key_vault_secret_name must be supplied to\nsource the certificate from Key Vault, or pfx_blob (and optionally\npassword) must be supplied to upload an inline PFX. The two modes are\nmutually exclusive.\n"
  type        = string
  default     = null
}

variable "key_vault_secret_name" {
  description = "(Optional) The name of the Key Vault secret/certificate that contains the PFX. Required when key_vault_id is set."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where the certificate resource will be created. Should match the App Service Plan."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the App Service certificate."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The resource ID of the parent resource group."
  type        = string
  default     = ""
}

variable "password" {
  description = "(Optional) The password protecting the PFX supplied via pfx_blob."
  type        = string
  default     = null
}

variable "pfx_blob" {
  description = "(Optional) The base64-encoded contents of the PFX file. Mutually exclusive with key_vault_id."
  type        = string
  default     = null
}

variable "retry" {
  description = "(Optional) Retry configuration for the underlying azapi resource."
  type = object({
    error_message_regex = list(string)
    interval_seconds    = optional(number, 10)
    max_retries         = optional(number, 3)
  })
  default = null
}

variable "server_farm_id" {
  description = "The resource ID of the App Service Plan that will host sites using this certificate. Required by Azure when sourcing the certificate from Key Vault."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags applied to the certificate resource."
  type        = map(string)
  default     = null
}
