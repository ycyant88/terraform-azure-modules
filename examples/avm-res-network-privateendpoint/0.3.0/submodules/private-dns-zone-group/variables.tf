variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Body-relative dot-notation paths ignored by the AzAPI provider. Ignored configuration is not sent to Azure until the path is removed. Changes take effect only after apply.\n\n- network_private_endpoints_private_dns_zone_groups - Paths ignored on the private DNS zone group.\n"
  type = object({
    network_private_endpoints_private_dns_zone_groups = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = ""
}

variable "name" {
  description = "Name of the private DNS zone group."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "Fully-qualified ARM resource ID of the parent private endpoint."
  type        = string
  default     = ""
}

variable "private_dns_zone_resource_ids" {
  description = "Private DNS zone resource IDs to include in the private DNS zone group."
  type        = list(string)
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by the private DNS zone group submodule."
  type = object({
    network_private_endpoints_private_dns_zone_groups = optional(string, "Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2025-07-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to the private DNS zone group AzAPI resource. Defaults to provider behavior."
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "timeouts" {
  description = "Default per-operation timeouts for the private DNS zone group AzAPI resource. Defaults to provider behavior."
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
