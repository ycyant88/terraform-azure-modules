variable "dev_center_environment_type_dev_center_id" {
  description = "(Required) The ID of the associated Dev Center. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "dev_center_environment_type_name" {
  description = "(Required) Specifies the name of this Dev Center Environment Type. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "dev_center_environment_type_tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Dev Center Environment Type."
  type        = map(string)
  default     = null
}

variable "dev_center_environment_type_timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating this Dev Center Environment Type.\n- delete - (Defaults to 30 minutes) Used when deleting this Dev Center Environment Type.\n- read - (Defaults to 5 minutes) Used when retrieving this Dev Center Environment Type.\n- update - (Defaults to 30 minutes) Used when updating this Dev Center Environment Type.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = ""
}
