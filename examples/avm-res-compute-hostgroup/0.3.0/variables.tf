variable "automatic_placement_enabled" {
  description = "Whether or not automatic placement is enabled for the host group."
  type        = bool
  default     = true
}

variable "dedicated_host_group_name" {
  description = "The name of the dedicated host."
  type        = string
  default     = ""
}

variable "dedicated_hosts" {
  description = "(Optional) A map of the hosts and their specifications in the Dedicated Host Group"
  type = map(object({
    name                    = string
    sku_name                = string
    auto_replace_on_failure = optional(bool, true)
    platform_fault_domain   = number
    license_type            = optional(string, "None")
    tags                    = optional(map(string), null)
  }))
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The location where the dedicated host group will be created."
  type        = string
  default     = ""
}

variable "platform_fault_domain_count" {
  description = "The number of fault domains that the host group can span."
  type        = number
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where dedicated host group will be deployed."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource"
  type        = map(string)
  default     = null
}

variable "zone" {
  description = "The Availability Zone for the Dedicated Host Group."
  type        = string
  default     = null
}
