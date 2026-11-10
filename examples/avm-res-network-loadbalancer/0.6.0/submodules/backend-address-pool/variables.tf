variable "avm_managed_migration_enabled" {
  description = "Import an existing pool at parent_id/backendAddressPools/name without deleting it. Enable only for adoption, never fresh creation; disable after convergence."
  type        = bool
  default     = false
}

variable "backend_address_type" {
  description = "NIC (default for omission/null) omits the projection and creates no explicit-member cleanup, leaving memberships to the NIC owner. Opt into IP or Frontend to own an explicit list with fixed-empty destroy cleanup. Keep existing IP pools explicitly IP; clear explicit members before changing to NIC, and detach NICs before changing from NIC."
  type        = string
  default     = "NIC"
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Body-relative dot paths. network_load_balancers_backend_address_pools contains pool paths to ignore. NIC references are omitted from writes; live membership preservation requires real-Azure verification. Ignored configuration is not sent to Azure; changes take effect after apply."
  type = object({
    network_load_balancers_backend_address_pools = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = ""
}

variable "name" {
  description = "The backend address pool name."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent load balancer resource ID."
  type        = string
  default     = ""
}

variable "properties" {
  description = "Writable pool ARM properties: virtualNetwork ID object, tunnelInterfaces (identifier/port/protocol/type), and authoritative loadBalancerBackendAddresses. Each member has name and properties containing exactly one of ipAddress (optional virtualNetwork ID object) or loadBalancerFrontendIPConfiguration ID object. Frontend members require Global tier/Frontend mode and no VNet. NIC mode requires an empty input list and omits the server projection; NIC ownership remains external."
  type = object({
    virtualNetwork = optional(object({ id = string }))
    tunnelInterfaces = optional(list(object({
      identifier = number
      port       = number
      protocol   = string
      type       = string
    })), [])
    loadBalancerBackendAddresses = optional(list(object({
      name = string
      properties = object({
        ipAddress                           = optional(string)
        virtualNetwork                      = optional(object({ id = string }))
        loadBalancerFrontendIPConfiguration = optional(object({ id = string }))
      })
    })), [])
  })
  default = ""
}

variable "resource_types" {
  description = "Resource API versions. network_load_balancers_backend_address_pools is the backend pool ARM resource type and API version."
  type = object({
    network_load_balancers_backend_address_pools = optional(string, "Microsoft.Network/loadBalancers/backendAddressPools@2025-01-01")
  })
  default = {}
}

variable "retry" {
  description = "Resource retry controls: error_message_regex, interval_seconds and max_interval_seconds."
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "sku_tier" {
  description = "Declaration of the externally owned parent LB tier, Regional or Global. The caller must match its actual SKU and use public Standard regional frontend IDs for Global members; this module does not inspect remote parents."
  type        = string
  default     = "Regional"
}

variable "timeouts" {
  description = "Per-operation create, read, update and delete timeouts as Go duration strings."
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
