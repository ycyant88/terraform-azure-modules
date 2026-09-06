variable "file_share_backup_policy" {
  description = "    A map objects for backup and retation options.\r\n\r\n    - name - (Optional) The name of the private endpoint. One will be generated if not set.\r\n    - role_assignments - (Optional) A map of role assignments to create on the \r\n\r\n    - backup - (required) backup options.\r\n        - frequency - (Required) Sets the backup frequency. Possible values are hourly, Daily and Weekly.\r\n        - time - (required) Specify time in a 24 hour format HH:MM. \"22:00\"\r\n        - hour_interval - (Optional) Interval in hour at which backup is triggered. Possible values are 4, 6, 8 and 12. This is used when frequency is hourly. 6\r\n        - hour_duration -  (Optional) Duration of the backup window in hours. Possible values are between 4 and 24 This is used when frequency is hourly. 12\r\n        - weekdays -  (Optional) The days of the week to perform backups on. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday. This is used when frequency is Weekly. [\"Tuesday\", \"Saturday\"]\r\n    - retention_daily - (Optional)\r\n      - count - \r\n    - retantion_weekly -\r\n      - count -\r\n      - weekdays -\r\n    - retantion_monthly -\r\n      - count -  # (Required) The number of monthly backups to keep. Must be between 1 and 9999\r\n      - weekdays - (Optional) The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.\r\n      - weeks -  # (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.\r\n      - days -  # (Optional) The days of the month to retain backups of. Must be between 1 and 31.\r\n      - include_last_days -  # (Optional) Including the last day of the month, default to false.\r\n    - retantion_yearly -\r\n      - months - # (Required) The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, August, September, October, November and December.\r\n      - count -  # (Required) The number of monthly backups to keep. Must be between 1 and 9999\r\n      - weekdays - (Optional) The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.\r\n      - weeks -  # (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.\r\n      - days -  # (Optional) The days of the month to retain backups of. Must be between 1 and 31.\r\n      - include_last_days -  # (Optional) Including the last day of the month, default to false.\r\n\r\n    example:\r\n      retentions = {\r\n      rest1 = {\r\n        backup = {\r\n          frequency     = \"hourly\"\r\n          time          = \"22:00\"\r\n          hour_interval = 6\r\n          hour_duration = 12\r\n          # weekdays      = [\"Tuesday\", \"Saturday\"]\r\n        }\r\n        retention_daily = 7\r\n        retention_weekly = {\r\n          count    = 7\r\n          weekdays = [\"Monday\", \"Wednesday\"]\r\n\r\n        }\r\n        retention_monthly = {\r\n          count = 5\r\n          # weekdays =  [\"Tuesday\",\"Saturday\"]\r\n          # weeks = [\"First\",\"Third\"]\r\n          days = [3, 10, 20]\r\n        }\r\n        retention_yearly = {\r\n          count  = 5\r\n          months = []\r\n          # weekdays =  [\"Tuesday\",\"Saturday\"]\r\n          # weeks = [\"First\",\"Third\"]\r\n          days = [3, 10, 20]\r\n        }\r\n\r\n        }\r\n      }\r\n"
  type = object({
    name     = string
    timezone = string

    frequency = string

    retention_daily = optional(number, null)

    backup = object({
      time = string
      hourly = optional(object({
        interval        = number
        start_time      = string
        window_duration = number
      }))
    })

    retention_weekly = optional(object({
      count    = optional(number, 7)
      weekdays = optional(list(string), [])
    }), {})

    retention_monthly = optional(object({
      count             = optional(number, 0)
      weekdays          = optional(list(string), [])
      weeks             = optional(list(string), [])
      days              = optional(list(number), [])
      include_last_days = optional(bool, false)
    }), {})

    retention_yearly = optional(object({
      count             = optional(number, 0)
      months            = optional(list(string), [])
      weekdays          = optional(list(string), [])
      weeks             = optional(list(string), [])
      days              = optional(list(number), [])
      include_last_days = optional(bool, false)
    }), {})
  })
  default = null
}

variable "recovery_vault_name" {
  description = "recovery_vault_name: specify a recovery_vault_name for the Azure Recovery Services Vault. Upper/Lower case letters, numbers and hyphens. number of characters 2-50"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}
