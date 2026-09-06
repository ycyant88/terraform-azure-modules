variable "archetype_config_overrides" {
  description = "OPTIONAL: If specified, will set custom Archetype configurations to the default Enterprise-scale Management Groups"
  type        = map(any)
  default     = {}
}

variable "custom_landing_zones" {
  description = "OPTIONAL: If specified, will deploy additional Management Groups alongside Enterprise-scale core Management Groups"
  type = map(
    object({
      display_name               = string
      parent_management_group_id = string
      subscription_ids           = list(string)
      archetype_config = object({
        archetype_id   = string
        parameters     = any
        access_control = any
      })
    })
  )
  default = {}
}

variable "default_location" {
  description = "OPTIONAL: If specified, will use set the default location used for resource deployments where needed."
  type        = string
  default     = "eastus"
}

variable "deploy_core_landing_zones" {
  description = "OPTIONAL: If set to true, will include the core Enterprise-scale Management Group hierarchy"
  type        = bool
  default     = true
}

variable "deploy_demo_landing_zones" {
  description = "OPTIONAL: If set to true, will include the demo \"Landing Zone\" Management Groups"
  type        = bool
  default     = false
}

variable "library_path" {
  description = "OPTIONAL: If specified, sets the path to a custom library folder for archetype artefacts."
  type        = string
  default     = ""
}

variable "root_id" {
  description = "OPTIONAL: If specified, will set a custom Name (ID) value for the Enterprise-scale \"root\" Management Group, and append this to the ID for all core Enterprise-scale Management Groups."
  type        = string
  default     = "es"
}

variable "root_name" {
  description = "OPTIONAL: If specified, will set a custom DisplayName value for the Enterprise-scale \"root\" Management Group"
  type        = string
  default     = "Enterprise-Scale"
}

variable "root_parent_id" {
  description = "The root_parent_id is used to specify where to set the root for all Landing Zone deployments. Usually the Tenant ID when deploying the core Enterprise-scale Landing Zones."
  type        = string
  default     = ""
}

variable "subscription_id_overrides" {
  description = "OPTIONAL: If specified, will be used to assign subscription_ids to the default Enterprise-scale Management Groups"
  type        = map(list(string))
  default     = {}
}

variable "template_file_variables" {
  description = "OPTIONAL: If specified, provides the ability to define custom template variables used when reading in template files from the library_path"
  type        = map(any)
  default     = {}
}
