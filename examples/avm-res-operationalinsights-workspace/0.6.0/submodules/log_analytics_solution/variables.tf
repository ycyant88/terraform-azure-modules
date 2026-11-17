variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Body-relative dot paths to ignore on the AzAPI resources of this module.\nChanges take effect only after apply.\nIgnored configuration is not sent to Azure until its path is removed.\n\n- operationsmanagement_solutions - Paths ignored on the solution.\n"
  type = object({
    operationsmanagement_solutions = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = null
}

variable "log_analytics_solution_location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "log_analytics_solution_plan" {
  description = "- product - (Required) The product name of the solution. For example OMSGallery/Containers. Changing this forces a new resource to be created.\n- promotion_code - (Optional) A promotion code to be used with the solution. Changing this forces a new resource to be created.\n- publisher - (Required) The publisher of the solution. For example Microsoft. Changing this forces a new resource to be created.\n"
  type = object({
    product        = string
    promotion_code = optional(string)
    publisher      = string
  })
  default = ""
}

variable "log_analytics_solution_solution_name" {
  description = "(Required) Specifies the name of the solution to be deployed. See [here for options](https://docs.microsoft.com/azure/log-analytics/log-analytics-add-solutions).Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "log_analytics_solution_tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "log_analytics_solution_timeouts" {
  description = "Per-operation timeouts for the Log Analytics Solution. An operation that is not set here uses timeouts, and otherwise the provider default. Values are Go duration strings.\n\n - create - Used when creating the Log Analytics Solution.\n - delete - Used when deleting the Log Analytics Solution.\n - read - Used when retrieving the Log Analytics Solution.\n - update - Used when updating the Log Analytics Solution.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "log_analytics_solution_workspace_name" {
  description = "(Required) The full name of the Log Analytics workspace with which the solution will be linked. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "log_analytics_solution_workspace_resource_id" {
  description = "(Required) The full resource ID of the Log Analytics workspace with which the solution will be linked. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "(Required) The resource ID of the resource group in which to create the Log Analytics solution, for example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg. The solution and its workspace must be in the same resource group. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions, in <provider>/<resource>@<api-version> form. Each key defaults to a tested value; supply only the keys you want to override.\n\n- operationsmanagement_solutions - The solution.\n"
  type = object({
    operationsmanagement_solutions = optional(string, "Microsoft.OperationsManagement/solutions@2015-11-01-preview")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to every AzAPI resource of this module.\nDefaults to null (no custom retry).\n\n- error_message_regex - Error-message patterns that trigger a retry.\n- interval_seconds - Initial interval between retries in seconds.\n- max_interval_seconds - Maximum interval between retries in seconds.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to every AzAPI resource of this module.\nThe solution uses log_analytics_solution_timeouts first, for the operations that it sets.\nDefaults to null (provider defaults). Values are Go duration strings.\n\n- create - Create timeout.\n- read - Read timeout.\n- update - Update timeout.\n- delete - Delete timeout.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
