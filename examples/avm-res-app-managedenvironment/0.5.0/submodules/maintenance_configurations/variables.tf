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

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "scheduled_entries" {
  description = "List of maintenance schedules for a managed environment.\n"
  type = list(object({
    duration_hours = number
    start_hour_utc = number
    week_day       = string
  }))
  default = ""
}
