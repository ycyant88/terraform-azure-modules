variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the dashboard."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "template_file_path" {
  description = "Dashboard template file path. For example, ./templates/defaultDashboard.tpl."
  type        = string
  default     = ""
}

variable "template_file_variables" {
  description = "List of variables values mapping for variables defined in the dashboard template file."
  type        = map(string)
  default     = {}
}
