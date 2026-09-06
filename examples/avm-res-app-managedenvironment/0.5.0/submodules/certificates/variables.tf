variable "certificate_key_vault_properties" {
  description = "Properties for a certificate stored in a Key Vault.\n\n- identity - Resource ID of a managed identity to authenticate with Azure Key Vault, or System to use a system-assigned identity.\n- key_vault_url - URL pointing to the Azure Key Vault secret that holds the certificate.\n\n"
  type = object({
    identity      = optional(string)
    key_vault_url = optional(string)
  })
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The location of the resource.\n"
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the resource.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "password" {
  description = "Certificate password.\n"
  type        = string
  default     = null
}

variable "password_version" {
  description = "Version tracker for password. Must be set when password is provided.\n"
  type        = number
  default     = null
}

variable "tags" {
  description = "(Optional) Tags of the resource.\n"
  type        = map(string)
  default     = null
}

variable "value" {
  description = "PFX or PEM blob\n"
  type        = any
  default     = null
}

variable "value_version" {
  description = "Version tracker for value. Must be set when value is provided.\n"
  type        = number
  default     = null
}
