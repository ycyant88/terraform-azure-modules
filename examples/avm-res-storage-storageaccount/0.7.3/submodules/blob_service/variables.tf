variable "blob_properties" {
  description = "(Required) Blob service-level settings to apply. This variable is required because the module is only instantiated when var.blob_properties is non-null."
  type = object({
    automatic_snapshot_policy_enabled = optional(bool)
    change_feed = optional(object({
      enabled           = optional(bool)
      retention_in_days = optional(number)
    }))
    container_delete_retention_policy = optional(object({
      allow_permanent_delete = optional(bool)
      days                   = optional(number)
      enabled                = optional(bool)
    }))
    cors_rules = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })))
    default_service_version = optional(string)
    delete_retention_policy = optional(object({
      allow_permanent_delete = optional(bool)
      days                   = optional(number)
      enabled                = optional(bool)
    }))
    last_access_time_tracking_policy = optional(object({
      blob_type                    = optional(list(string))
      enable                       = bool
      name                         = optional(string)
      tracking_granularity_in_days = optional(number)
    }))
    restore_policy = optional(object({
      days    = optional(number)
      enabled = bool
    }))
    versioning_enabled = optional(bool)
  })
  default = ""
}

variable "resource_type" {
  description = "(Optional) Override the AzAPI <provider>/<resource>@<api-version> string used to patch the blob service. Defaults to the value tested with this module version."
  type        = string
  default     = "Microsoft.Storage/storageAccounts/blobServices@2025-06-01"
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
