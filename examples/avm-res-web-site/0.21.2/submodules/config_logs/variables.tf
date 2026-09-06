variable "application_logs" {
  description = "Application log settings.\n\n- azure_blob_storage - (Optional) Azure Blob Storage configuration for application logs.\n  - level - (Optional) The log level. Defaults to Off.\n  - retention_in_days - (Optional) The retention period in days. Defaults to 0.\n  - sas_url - (Required) The SAS URL to the Azure Blob Storage container.\n- file_system - (Optional) File system configuration for application logs.\n  - level - (Optional) The file system log level. Defaults to Off.\n"
  type = object({
    azure_blob_storage = optional(object({
      level             = optional(string, "Off")
      retention_in_days = optional(number, 0)
      sas_url           = string
    }))
    file_system = optional(object({
      level = optional(string, "Off")
    }), {})
  })
  default = null
}

variable "detailed_error_messages" {
  description = "Should detailed error messages be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "failed_requests_tracing" {
  description = "Should failed request tracing be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "http_logs" {
  description = "HTTP log settings.\n\n- azure_blob_storage - (Optional) Azure Blob Storage configuration for HTTP logs.\n  - retention_in_days - (Optional) The retention period in days. Defaults to 0.\n  - sas_url - (Required) The SAS URL to the Azure Blob Storage container.\n- file_system - (Optional) File system configuration for HTTP logs.\n  - retention_in_days - (Optional) The retention period in days. Defaults to 0.\n  - retention_in_mb - (Required) The maximum size in MB before being rotated.\n"
  type = object({
    azure_blob_storage = optional(object({
      retention_in_days = optional(number, 0)
      sas_url           = string
    }))
    file_system = optional(object({
      retention_in_days = optional(number, 0)
      retention_in_mb   = number
    }))
  })
  default = null
}

variable "parent_id" {
  description = "The resource ID of the App Service site."
  type        = string
  default     = ""
}
