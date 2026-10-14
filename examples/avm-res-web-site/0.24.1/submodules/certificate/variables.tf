variable "host_names" {
  description = "(Optional) The host names the certificate applies to. If omitted, Azure derives them from the certificate's subject alternative names."
  type        = list(string)
  default     = null
}

variable "ignore_body_changes" {
  description = "Body-relative paths whose changes are ignored, keyed by AzAPI resource type. Paths use dot notation, and a change takes effect only after an apply.\n\n- web_certificates - Paths ignored on the certificate.\n"
  type = object({
    web_certificates = optional(list(string), [])
  })
  default = {}
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

variable "resource_types" {
  description = "AzAPI resource types and API versions used by this module.\n\n- web_certificates - Resource type and API version for the certificate.\n"
  type = object({
    web_certificates = optional(string, "Microsoft.Web/certificates@2025-03-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration for the AzAPI resources declared by this module. Defaults to retrying the conflict Azure returns while another operation on the site is in progress.\n\n- error_message_regex - (Optional) A list of regular expressions matched against error messages. A match triggers a retry.\n- interval_seconds - (Optional) The initial interval in seconds between retries.\n- max_interval_seconds - (Optional) The maximum interval in seconds between retries.\n"
  type = object({
    error_message_regex  = optional(list(string), ["Cannot modify this site because another operation is in progress"])
    interval_seconds     = optional(number, 10)
    max_interval_seconds = optional(number)
  })
  default = {}
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

variable "timeouts" {
  description = "Per-operation timeouts applied to the AzAPI resources declared by this module. Defaults to null, which uses the provider defaults. Each value is a Go duration string such as 30m.\n\n- create - (Optional) Timeout for create operations.\n- delete - (Optional) Timeout for delete operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
