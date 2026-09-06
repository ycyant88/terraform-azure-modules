variable "cors_propagation_wait" {
  description = "(Optional) Duration to wait after a successful CORS PATCH before allowing dependents to refresh, expressed as a Go duration string (e.g. 2m, 90s).\n\nThe ARM GET on tableServices/default is eventually consistent: immediately after a successful PATCH the read can omit the corsRules that were just applied, which causes a follow-up terraform plan (and the post-apply idempotency check) to see false drift on body.properties.cors. The read-back stabilises after roughly two minutes, so this wait is applied via a time_sleep resource. Set to \"0s\" to disable the wait entirely (not recommended when cors_rules is set).\n"
  type        = string
  default     = "2m"
}

variable "resource_type" {
  description = "(Optional) Override the AzAPI <provider>/<resource>@<api-version> string used to patch the table service. Defaults to the value tested with this module version."
  type        = string
  default     = "Microsoft.Storage/storageAccounts/tableServices@2025-06-01"
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

variable "table_properties" {
  description = "(Required) Table service-level settings to apply to the storage account's tableServices/default sub-resource."
  type = object({
    cors_rules = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })))
  })
  default = ""
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
