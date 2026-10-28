variable "dev_center_dev_box_definition_dev_center_id" {
  description = "(Required) The ID of the associated Dev Center. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "dev_center_dev_box_definition_image_reference_id" {
  description = "(Required) The ID of the image for the Dev Center Dev Box Definition."
  type        = string
  default     = ""
}

variable "dev_center_dev_box_definition_location" {
  description = "(Required) The Azure Region where the Dev Center Dev Box Definition should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "dev_center_dev_box_definition_name" {
  description = "(Required) Specifies the name of this Dev Center Dev Box Definition. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "dev_center_dev_box_definition_sku_name" {
  description = "(Required) The name of the SKU for the Dev Center Dev Box Definition."
  type        = string
  default     = ""
}

variable "dev_center_dev_box_definition_tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Dev Center Dev Box Definition."
  type        = map(string)
  default     = null
}

variable "dev_center_dev_box_definition_timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating this Dev Center Dev Box Definition.\n- delete - (Defaults to 30 minutes) Used when deleting this Dev Center Dev Box Definition.\n- read - (Defaults to 5 minutes) Used when retrieving this Dev Center Dev Box Definition.\n- update - (Defaults to 30 minutes) Used when updating this Dev Center Dev Box Definition.\n"
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
