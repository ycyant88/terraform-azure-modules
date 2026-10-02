variable "custom_domains" {
  description = "Custom domain bindings for Http Routes' hostnames.\n"
  type = list(object({
    binding_type   = optional(any)
    certificate_id = optional(string)
    name           = string
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

variable "rules" {
  description = "Routing Rules for the Http Route resource.\n"
  type = list(object({
    description = optional(string)
    routes = optional(list(object({
      action = optional(object({
        prefix_rewrite = optional(string)
      }))
      match = optional(object({
        case_sensitive        = optional(bool)
        path                  = optional(string)
        path_separated_prefix = optional(string)
        prefix                = optional(string)
      }))
    })))
    targets = optional(list(object({
      container_app = string
      label         = optional(string)
      revision      = optional(string)
      weight        = optional(number)
    })))
  }))
  default = null
}
