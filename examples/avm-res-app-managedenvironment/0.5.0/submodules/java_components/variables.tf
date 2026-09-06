variable "component_type" {
  description = "The componentType of the resource.\n"
  type        = string
  default     = ""
}

variable "configurations" {
  description = "List of Java Components configuration properties\n"
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

variable "ingress" {
  description = "Java Component Ingress configurations.\n\n\n"
  type        = object({})
  default     = null
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

variable "scale" {
  description = "Java component scaling configurations\n\n- max_replicas - Optional. Maximum number of Java component replicas\n- min_replicas - Optional. Minimum number of Java component replicas. Defaults to 1 if not set\n\n"
  type = object({
    max_replicas = optional(number)
    min_replicas = optional(number)
  })
  default = null
}

variable "service_binds" {
  description = "List of Java Components that are bound to the Java component\n"
  type = list(object({
    name       = optional(string)
    service_id = optional(string)
  }))
  default = null
}

variable "spring_cloud_gateway_routes" {
  description = "Gateway route definition.\n\n- filters - List of gateway filters to apply.\n- id - ID for the route.\n- order - Ordering of the route.\n- predicates - List of predicates to match.\n- uri - URI of the route.\n"
  type = list(object({
    filters    = optional(list(string))
    id         = string
    order      = optional(number)
    predicates = optional(list(string))
    uri        = string
  }))
  default = null
}
