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

variable "parent_id" {
  description = "The resource ID of the App Service site."
  type        = string
  default     = ""
}

variable "retry" {
  description = "Retry configuration for azapi resources."
  type = object({
    error_message_regex = list(string)
    interval_seconds    = optional(number, 10)
    max_retries         = optional(number, 3)
  })
  default = { "error_message_regex" : ["Cannot modify this site because another operation is in progress"] }
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
