variable "maintenance_window" {
  description = "Maintenance window used to configure scheduled auto-upgrade for a Managed Cluster.\n\n- duration_hours - Length of maintenance window range from 4 to 24 hours.\n- not_allowed_dates - Date ranges on which upgrade is not allowed. 'utcOffset' applies to this field. For example, with 'utcOffset: +02:00' and 'dateSpan' being '2022-12-23' to '2023-01-03', maintenance will be blocked from '2022-12-22 22:00' to '2023-01-03 22:00' in UTC time.\n- schedule - One and only one of the schedule types should be specified. Choose either 'daily', 'weekly', 'absoluteMonthly' or 'relativeMonthly' for your maintenance schedule.\n  - absolute_monthly - For schedules like: 'recur every month on the 15th' or 'recur every 3 months on the 20th'.\n    - day_of_month - The date of the month.\n    - interval_months - Specifies the number of months between each set of occurrences.\n  - daily - For schedules like: 'recur every day' or 'recur every 3 days'.\n    - interval_days - Specifies the number of days between each set of occurrences.\n  - relative_monthly - For schedules like: 'recur every month on the first Monday' or 'recur every 3 months on last Friday'.\n    - day_of_week - The weekday enum.\n    - interval_months - Specifies the number of months between each set of occurrences.\n    - week_index - The week index. Specifies on which week of the month the dayOfWeek applies.\n  - weekly - For schedules like: 'recur every Monday' or 'recur every 3 weeks on Wednesday'.\n    - day_of_week - The weekday enum.\n    - interval_weeks - Specifies the number of weeks between each set of occurrences.\n- start_date - The date the maintenance window activates. If the current date is before this date, the maintenance window is inactive and will not be used for upgrades. If not specified, the maintenance window will be active right away.\n- start_time - The start time of the maintenance window. Accepted values are from '00:00' to '23:59'. 'utcOffset' applies to this field. For example: '02:00' with 'utcOffset: +02:00' means UTC time '00:00'.\n- utc_offset - The UTC offset in format +/-HH:mm. For example, '+05:30' for IST and '-07:00' for PST. If not specified, the default is '+00:00'.\n\n"
  type = object({
    duration_hours = number
    not_allowed_dates = optional(list(object({
      end   = string
      start = string
    })))
    schedule = object({
      absolute_monthly = optional(object({
        day_of_month    = number
        interval_months = number
      }))
      daily = optional(object({
        interval_days = number
      }))
      relative_monthly = optional(object({
        day_of_week     = string
        interval_months = number
        week_index      = string
      }))
      weekly = optional(object({
        day_of_week    = string
        interval_weeks = number
      }))
    })
    start_date = optional(string)
    start_time = string
    utc_offset = optional(string)
  })
  default = null
}

variable "name" {
  description = "The name of the resource.\n"
  type        = string
  default     = ""
}

variable "not_allowed_time" {
  description = "Time slots on which upgrade is not allowed.\n"
  type = list(object({
    end   = optional(string)
    start = optional(string)
  }))
  default = null
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "time_in_week" {
  description = "Time slots during the week when planned maintenance is allowed to proceed. If two array entries specify the same day of the week, the applied configuration is the union of times in both entries.\n"
  type = list(object({
    day        = optional(string)
    hour_slots = optional(list(number))
  }))
  default = null
}
