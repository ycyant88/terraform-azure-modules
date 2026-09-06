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

variable "log_analytics_solution_resource_group_name" {
  description = "(Required) The name of the resource group in which the Log Analytics solution is created. Changing this forces a new resource to be created. Note: The solution and its related workspace can only exist in the same resource group."
  type        = string
  default     = ""
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
  description = "- create - (Defaults to 30 minutes) Used when creating the Log Analytics Solution.\n- delete - (Defaults to 30 minutes) Used when deleting the Log Analytics Solution.\n- read - (Defaults to 5 minutes) Used when retrieving the Log Analytics Solution.\n- update - (Defaults to 30 minutes) Used when updating the Log Analytics Solution.\n"
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
