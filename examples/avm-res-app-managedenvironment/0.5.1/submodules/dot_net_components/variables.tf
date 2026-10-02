variable "component_type" {
  description = "Type of the .NET Component.\n"
  type        = any
  default     = null
}

variable "configurations" {
  description = "List of .NET Components configuration properties\n"
  type = list(object({
    property_name = optional(string)
    value         = optional(string)
  }))
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.\n"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the resource.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "service_binds" {
  description = "List of .NET Components that are bound to the .NET component\n"
  type = list(object({
    name       = optional(string)
    service_id = optional(string)
  }))
  default = null
}
