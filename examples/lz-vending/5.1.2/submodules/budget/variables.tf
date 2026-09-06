variable "budget_amount" {
  description = "The total amount of cost to track with the budget."
  type        = number
  default     = ""
}

variable "budget_name" {
  description = "The name of the budget."
  type        = string
  default     = ""
}

variable "budget_notifications" {
  description = "The notifications for the budget."
  type = map(object({
    enabled        = bool
    operator       = string
    threshold      = number
    threshold_type = optional(string, "Actual")
    contact_emails = optional(list(string), [])
    contact_roles  = optional(list(string), [])
    contact_groups = optional(list(string), [])
    locale         = optional(string, "en-us")
  }))
  default = {}
}

variable "budget_scope" {
  description = "The scope of the budget."
  type        = string
  default     = ""
}

variable "budget_time_grain" {
  description = "The time grain of the budget."
  type        = string
  default     = ""
}

variable "budget_time_period" {
  description = "The time period of the budget."
  type = object({
    start_date = string
    end_date   = string
  })
  default = ""
}
