variable "application_type" {
  description = "(Required) The type of the application. Possible values are 'web', 'ios', 'java', 'phone', 'MobileCenter', 'other', 'store'."
  type        = string
  default     = "web"
}

variable "daily_data_cap_in_gb" {
  description = "(Optional) The daily data cap in GB. 0 means unlimited."
  type        = number
  default     = 100
}

variable "daily_data_cap_notifications_disabled" {
  description = "(Optional) Disables the daily data cap notifications."
  type        = bool
  default     = false
}

variable "disable_ip_masking" {
  description = "(Optional) Disables IP masking. Defaults to false. For more information see <https://aka.ms/avm/ipmasking>."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "internet_ingestion_enabled" {
  description = "(Optional) Enables internet ingestion. Defaults to true."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "(Optional) Enables internet query. Defaults to true."
  type        = bool
  default     = true
}

variable "local_authentication_disabled" {
  description = "(Optional) Disables local authentication. Defaults to false."
  type        = bool
  default     = false
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n  \n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n  \n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "retention_in_days" {
  description = "(Optional) The retention period in days. 0 means unlimited."
  type        = number
  default     = 90
}

variable "sampling_percentage" {
  description = "(Optional) The sampling percentage. 100 means all."
  type        = number
  default     = 100
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "workspace_id" {
  description = "(Required) The ID of the Log Analytics workspace to send data to. AzureRm supports classic; however, Azure has deprecated it, thus it's required"
  type        = string
  default     = ""
}
