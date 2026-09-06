variable "access_control" {
  description = "OPTIONAL: If specified, will use the specified access control map to set Role Assignments on the archetype instance at the current scope."
  type        = map(any)
  default     = {}
}

variable "archetype_id" {
  description = "Specifies the ID of the archetype to apply against the provided scope. Must be a valid archetype ID from either the built-in module library, or as defined by the library_path variable."
  type        = string
  default     = ""
}

variable "default_location" {
  description = "Sets the default location used for resource deployments where needed."
  type        = string
  default     = ""
}

variable "library_path" {
  description = "OPTIONAL: If specified, sets the path to a custom library folder for archetype artefacts."
  type        = string
  default     = ""
}

variable "parameters" {
  description = "OPTIONAL: If specified, will use the specified parameters to override archetype defaults."
  type        = map(any)
  default     = {}
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

variable "template_file_variables" {
  description = "OPTIONAL: If specified, provides the ability to define custom template vars used when reading in template files from the library_path"
  type        = map(any)
  default     = {}
}
