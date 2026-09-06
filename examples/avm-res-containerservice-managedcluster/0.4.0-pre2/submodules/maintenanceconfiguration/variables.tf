variable "day_of_month" {
  description = "Day of month (AbsoluteMonthly)."
  type        = number
  default     = null
}

variable "day_of_week" {
  description = "Day of week (Weekly or RelativeMonthly)."
  type        = string
  default     = null
}

variable "duration_hours" {
  description = "Duration of the maintenance window in hours."
  type        = number
  default     = ""
}

variable "enable" {
  description = "Whether to create the maintenance configuration resource."
  type        = bool
  default     = true
}

variable "enable_telemetry" {
  description = "Whether telemetry headers should be added."
  type        = bool
  default     = false
}

variable "frequency" {
  description = "Maintenance window frequency: Daily, Weekly, AbsoluteMonthly, RelativeMonthly."
  type        = string
  default     = ""
}

variable "interval" {
  description = "Interval associated with the frequency (days, weeks or months depending on frequency)."
  type        = number
  default     = ""
}

variable "not_allowed_end" {
  description = "End date for a single not-allowed date range (YYYY-MM-DD)."
  type        = string
  default     = null
}

variable "not_allowed_start" {
  description = "Start date for a single not-allowed date range (YYYY-MM-DD)."
  type        = string
  default     = null
}

variable "parent_id" {
  description = "Resource ID of the parent managed cluster."
  type        = string
  default     = ""
}

variable "start_date" {
  description = "Optional ISO8601 start date (YYYY-MM-DD)."
  type        = string
  default     = null
}

variable "start_time" {
  description = "Start time (HH:MM)."
  type        = string
  default     = "00:00"
}

variable "user_agent_header" {
  description = "User-Agent header value when telemetry is enabled."
  type        = string
  default     = null
}

variable "utc_offset" {
  description = "UTC offset (+/-HH:MM)."
  type        = string
  default     = "+00:00"
}

variable "week_index" {
  description = "Week index within month (e.g. First, Second, Third, Fourth, Last) for RelativeMonthly."
  type        = string
  default     = null
}
