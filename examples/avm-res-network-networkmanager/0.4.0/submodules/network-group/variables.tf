variable "description" {
  description = "  (Optional) The description of the network group.\n"
  type        = string
  default     = ""
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

variable "member_type" {
  description = "  (Optional) The type of members in the network group. Possible values are VirtualNetwork and Subnet.\n"
  type        = string
  default     = "VirtualNetwork"
}

variable "name" {
  description = "  (Required) The name of the network group.\n"
  type        = string
  default     = ""
}

variable "network_manager_id" {
  description = "  (Required) The ID of the Network Manager.\n"
  type        = string
  default     = ""
}

variable "static_members" {
  description = "  (Optional) A list of static members to be included in the network group. Each static member requires a name and a target resource ID.\n"
  type = list(object({
    name               = string
    target_resource_id = string
  }))
  default = []
}
