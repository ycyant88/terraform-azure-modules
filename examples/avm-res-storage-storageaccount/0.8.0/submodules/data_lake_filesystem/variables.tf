variable "default_encryption_scope" {
  description = "(Optional) The default encryption scope to use for this filesystem. Defaults to null (the storage account default encryption scope is used)."
  type        = string
  default     = null
}

variable "metadata" {
  description = "(Optional) A mapping of key-value pairs assigned to this filesystem. Defaults to null (no metadata)."
  type        = map(string)
  default     = null
}

variable "name" {
  description = "(Required) The name of the Data Lake Gen2 filesystem."
  type        = string
  default     = ""
}

variable "resource_type" {
  description = "(Optional) Override the AzAPI <provider>/<resource>@<api-version> string used to manage the Data Lake Gen2 filesystem (a blob container in ARM). Defaults to the value tested with this module version."
  type        = string
  default     = "Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01"
}

variable "retry" {
  description = "(Optional) Retry configuration applied to the AzAPI resource. Defaults to null (no custom retry).\n\n- error_message_regex - (Optional) A list of regex patterns matching error messages that trigger a retry. Defaults to null.\n- interval_seconds - (Optional) Initial interval between retries in seconds. Defaults to null (provider default).\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds. Defaults to null (provider default).\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "storage_account_id" {
  description = "(Required) The full resource ID of the parent storage account."
  type        = string
  default     = ""
}

variable "timeouts" {
  description = "(Optional) Per-operation timeouts applied to the AzAPI resource. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n\n- create - (Optional) Timeout for create operations. Defaults to null.\n- read - (Optional) Timeout for read operations. Defaults to null.\n- update - (Optional) Timeout for update operations. Defaults to null.\n- delete - (Optional) Timeout for delete operations. Defaults to null.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "tracing_tags_header" {
  description = "(Optional) User-Agent string injected into AzAPI request headers. Defaults to null (no custom header)."
  type        = string
  default     = null
}
