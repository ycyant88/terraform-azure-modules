variable "app_setting_names" {
  description = "A list of app setting names that should be sticky (not swapped during slot swaps)."
  type        = list(string)
  default     = []
}

variable "connection_string_names" {
  description = "A list of connection string names that should be sticky (not swapped during slot swaps)."
  type        = list(string)
  default     = []
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
