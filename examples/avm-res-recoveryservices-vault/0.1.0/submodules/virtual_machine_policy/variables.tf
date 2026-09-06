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

variable "vm_backup_policy" {
  description = "    A map objects for backup and retation options.\n\n    - name - (Optional) The name of the private endpoint. One will be generated if not set.\n    - role_assignments - (Optional) A map of role assignments to create on the \n\n    - backup - (required) backup options.\n        - frequency - (Required) Sets the backup frequency. Possible values are Hourly, Daily and Weekly.\n        - time - (required) Specify time in a 24 hour format HH:MM. \"22:00\"\n        - hour_interval - (Optional) Interval in hour at which backup is triggered. Possible values are 4, 6, 8 and 12. This is used when frequency is Hourly. 6\n        - hour_duration -  (Optional) Duration of the backup window in hours. Possible values are between 4 and 24 This is used when frequency is Hourly. 12\n        - weekdays -  (Optional) The days of the week to perform backups on. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday. This is used when frequency is Weekly. [\"Tuesday\", \"Saturday\"]\n    - retention_daily - (Optional)\n      - count - \n    - retantion_weekly -\n      - count -\n      - weekdays -\n    - retantion_monthly -\n      - count -  # (Required) The number of monthly backups to keep. Must be between 1 and 9999\n      - weekdays - (Optional) The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.\n      - weeks -  # (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.\n      - days -  # (Optional) The days of the month to retain backups of. Must be between 1 and 31.\n      - include_last_days -  # (Optional) Including the last day of the month, default to false.\n    - retantion_yearly -\n      - months - # (Required) The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, August, September, October, November and December.\n      - count -  # (Required) The number of monthly backups to keep. Must be between 1 and 9999\n      - weekdays - (Optional) The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.\n      - weeks -  # (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.\n      - days -  # (Optional) The days of the month to retain backups of. Must be between 1 and 31.\n      - include_last_days -  # (Optional) Including the last day of the month, default to false.\n\n    example:\n      retentions = {\n      rest1 = {\n        backup = {\n          frequency     = \"Hourly\"\n          time          = \"22:00\"\n          hour_interval = 6\n          hour_duration = 12\n          # weekdays      = [\"Tuesday\", \"Saturday\"]\n        }\n        retention_daily = 7\n        retention_weekly = {\n          count    = 7\n          weekdays = [\"Monday\", \"Wednesday\"]\n\n        }\n        retention_monthly = {\n          count = 5\n          # weekdays =  [\"Tuesday\",\"Saturday\"]\n          # weeks = [\"First\",\"Third\"]\n          days = [3, 10, 20]\n        }\n        retention_yearly = {\n          count  = 5\n          months = []\n          # weekdays =  [\"Tuesday\",\"Saturday\"]\n          # weeks = [\"First\",\"Third\"]\n          days = [3, 10, 20]\n        }\n\n        }\n      }\n"
  type = object({
    name                           = string
    timezone                       = string
    instant_restore_retention_days = optional(number, null)
    instant_restore_resource_group = map(object({
      prefix = optional(string, null)
      suffix = optional(string, null)

    }))
    policy_type = string
    frequency   = string

    retention_daily = optional(number, null)

    backup = object({
      time          = string
      hour_interval = optional(number, null)
      hour_duration = optional(number, null)
      weekdays      = optional(list(string), [])
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
