variable "account_key" {
  description = "Storage account key for azure file.\n"
  type        = string
  default     = null
}

variable "account_key_version" {
  description = "Version tracker for account_key. Must be set when account_key is provided.\n"
  type        = number
  default     = null
}

variable "azure_file" {
  description = "Azure file properties\n\n- access_mode - Access mode for storage\n- account_key - Storage account key for azure file.\n- account_key_vault_properties - Storage account key stored as an Azure Key Vault secret.\n  - identity - Resource ID of a managed identity to authenticate with Azure Key Vault, or System to use a system-assigned identity.\n  - key_vault_url - URL pointing to the Azure Key Vault secret.\n- account_name - Storage account name for azure file.\n- share_name - Azure file share name.\n\n"
  type = object({
    access_mode = optional(any)
    account_key = optional(string)
    account_key_vault_properties = optional(object({
      identity      = optional(string)
      key_vault_url = optional(string)
    }))
    account_name = optional(string)
    share_name   = optional(string)
  })
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.\n"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the resource.\n"
  type        = string
  default     = ""
}

variable "nfs_azure_file" {
  description = "NFS Azure file properties\n\n- access_mode - Access mode for storage\n- server - Server for NFS azure file. Specify the Azure storage account server address.\n- share_name - NFS Azure file share name.\n\n"
  type = object({
    access_mode = optional(any)
    server      = optional(string)
    share_name  = optional(string)
  })
  default = null
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}
