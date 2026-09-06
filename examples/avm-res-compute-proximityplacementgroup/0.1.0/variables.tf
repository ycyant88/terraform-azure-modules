variable "allowed_vm_sizes" {
  description = "(Optional) Specifies the supported sizes of virtual machines that can be created in the proximity placement group."
  type        = list(string)
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The Azure location where the proximity placement group should exist."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "The name of the proximity placement group."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the proximity placement group."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags to assign to the proximity placement group."
  type        = map(string)
  default     = null
}

variable "zone" {
  description = "(Required) Specifies the supported zone of the proximity placement group. Changing this forces a new resource to be created."
  type        = string
  default     = "1"
}
