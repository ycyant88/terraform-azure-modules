variable "avm_managed_migration_enabled" {
  description = "Import an existing rule at parent_id/inboundNatRules/name without deleting it. Enable only for adoption, never fresh creation; disable after convergence."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Body-relative dot paths. network_load_balancers_inbound_nat_rules contains NAT rule paths to ignore. Ignored configuration is not sent to Azure; changes take effect after apply."
  type = object({
    network_load_balancers_inbound_nat_rules = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = ""
}

variable "name" {
  description = "The inbound NAT rule name."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent load balancer resource ID."
  type        = string
  default     = ""
}

variable "properties" {
  description = "NAT ARM properties: frontendIPConfiguration and optional backendAddressPool ID objects, protocol, frontendPort or frontendPortRangeStart/End, backendPort, enableFloatingIP, enableTcpReset and idleTimeoutInMinutes."
  type = object({
    frontendIPConfiguration = object({ id = string })
    backendAddressPool      = optional(object({ id = string }))
    protocol                = optional(string, "Tcp")
    frontendPort            = optional(number)
    frontendPortRangeStart  = optional(number)
    frontendPortRangeEnd    = optional(number)
    backendPort             = number
    enableFloatingIP        = optional(bool, false)
    enableTcpReset          = optional(bool, false)
    idleTimeoutInMinutes    = optional(number, 4)
  })
  default = ""
}

variable "resource_types" {
  description = "Resource API versions. network_load_balancers_inbound_nat_rules is the NAT rule ARM resource type and API version."
  type = object({
    network_load_balancers_inbound_nat_rules = optional(string, "Microsoft.Network/loadBalancers/inboundNatRules@2025-01-01")
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
