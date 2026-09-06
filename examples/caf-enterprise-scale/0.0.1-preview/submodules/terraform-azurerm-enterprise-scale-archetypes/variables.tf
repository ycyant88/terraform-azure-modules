variable "archetype_id" {
  description = "Specifies the ID of the archetype to apply against the provided scope. Must be a valid archetype ID from either the built-in module library, or as defined by the archetype_library_path variable."
  type        = string
  default     = ""
}

variable "archetype_library_path" {
  description = "OPTIONAL: If specified, sets the path to a custom library folder for archetype artefacts."
  type        = string
  default     = ""
}

variable "archetype_parameters" {
  description = "OPTIONAL: If specified, will use the specified parameters to override archetype defaults."
  type        = map(any)
  default     = ""
}

variable "default_location" {
  description = "OPTIONAL: If specified, will use set the default location used for resource deployments where needed."
  type        = string
  default     = "eastus"
}

variable "root_id" {
  description = "Specifies the ID of the Enterprise-scale root Management Group where Policy Definitions are created by default."
  type        = string
  default     = ""
}

variable "scope_id" {
  description = "Specifies the scope to apply the archetype resources against."
  type        = string
  default     = ""
}
