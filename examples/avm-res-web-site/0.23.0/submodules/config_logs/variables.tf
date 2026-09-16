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

variable "ignore_body_changes" {
  description = "Body-relative paths whose changes are ignored, keyed by AzAPI resource type. Paths use dot notation, and a change takes effect only after an apply.\n\nThe AzAPI provider exposes ignore_body_changes on azapi_resource only, and this module manages its resource with a type that does not accept the argument. The variable exists for interface consistency; setting a non-empty value fails the plan with an explicit error rather than being silently ignored.\n- web_sites_config - Paths ignored on the logs configuration.\n"
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
  description = "AzAPI resource types and API versions used by this module.\n\n- web_sites_config - Resource type and API version for the logs configuration.\n"
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
