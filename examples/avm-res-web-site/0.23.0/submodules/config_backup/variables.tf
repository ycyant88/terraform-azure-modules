variable "backup_name" {
  description = "The name of the backup. If not set, a default name will be generated."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Is backup enabled? Defaults to true."
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Body-relative paths whose changes are ignored, keyed by AzAPI resource type. Paths use dot notation, and a change takes effect only after an apply.\n\nThe AzAPI provider exposes ignore_body_changes on azapi_resource only, and this module manages its resource with a type that does not accept the argument. The variable exists for interface consistency; setting a non-empty value fails the plan with an explicit error rather than being silently ignored.\n- web_sites_config - Paths ignored on the backup configuration.\n"
  type = object({
    web_sites_config = optional(list(string), [])
  })
  default = {}
}

variable "parent_id" {
  description = "The resource ID of the App Service site."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by this module.\n\n- web_sites_config - Resource type and API version for the backup configuration.\n"
  type = object({
    web_sites_config = optional(string, "Microsoft.Web/sites/config@2025-03-01")
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

variable "schedule" {
  description = "The backup schedule configuration.\n\n- frequency_interval - (Optional) How often the backup should be executed.\n- frequency_unit - (Optional) The unit of time for the backup frequency. Possible values are Day and Hour.\n- keep_at_least_one_backup - (Optional) Should at least one backup always be kept?\n- retention_period_days - (Optional) The number of days to retain backups.\n- start_time - (Optional) The start time for the backup schedule.\n"
  type = object({
    frequency_interval       = optional(number)
    frequency_unit           = optional(string)
    keep_at_least_one_backup = optional(bool)
    retention_period_days    = optional(number)
    start_time               = optional(string)
  })
  default = null
}

variable "storage_account_url" {
  description = "The SAS URL to the Storage Account container for backup."
  type        = string
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
