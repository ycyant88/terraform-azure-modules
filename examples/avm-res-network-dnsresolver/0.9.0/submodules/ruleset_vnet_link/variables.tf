variable "dns_forwarding_ruleset_id" {
  description = "The ID of the DNS forwarding ruleset to link to the virtual networks."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "(Optional) Body property paths whose changes the azapi provider ignores after creation, letting an out-of-band controller own those properties without producing perpetual terraform plan drift.\n\n- network_dns_forwarding_rulesets_virtual_network_links - (Optional) Ignored body paths for the virtual network links, in dot notation relative to the request body, for example [\"properties.metadata\"]. Default [].\n\nWhile a path is ignored, configuration changes at that path are no longer sent to Azure. The value is write-only provider state, so a change only takes effect after an apply, and supplying a non-empty list requires Terraform 1.11 or later. An empty list is collapsed to null before it reaches the provider.\n"
  type = object({
    network_dns_forwarding_rulesets_virtual_network_links = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = null
}

variable "resource_types" {
  description = "(Optional) The Azure resource type and API version used for each resource created by this module.\n\n- network_dns_forwarding_rulesets_virtual_network_links - (Optional) The type and API version of the virtual network links. Default Microsoft.Network/dnsForwardingRulesets/virtualNetworkLinks@2025-05-01.\n"
  type = object({
    network_dns_forwarding_rulesets_virtual_network_links = optional(string, "Microsoft.Network/dnsForwardingRulesets/virtualNetworkLinks@2025-05-01")
  })
  default = {}
}

variable "retry" {
  description = "(Optional) The retry configuration applied to every azapi_resource created by this module.\n\n- error_message_regex - (Optional) A list of regular expressions matched against the error message. The request is retried when any of them matches. The AzAPI provider requires this attribute, so it cannot be null; pass [] to disable retries. The default covers AnotherOperationInProgress (a concurrent write against the same forwarding ruleset or virtual network), ReferencedResourceNotProvisioned (the virtual network is still provisioning) and CannotDeleteResource (on teardown, ARM still reports a nested resource as present after its DELETE has already completed).\n- interval_seconds - (Optional) The base number of seconds to wait between retries. Defaults to the AzAPI provider default (10).\n- max_interval_seconds - (Optional) The maximum number of seconds to wait between retries. Defaults to the AzAPI provider default (180).\n"
  type = object({
    error_message_regex = optional(list(string), [
      "AnotherOperationInProgress",
      "ReferencedResourceNotProvisioned",
      "CannotDeleteResource",
    ])
    interval_seconds     = optional(number, null)
    max_interval_seconds = optional(number, null)
  })
  default = {}
}

variable "timeouts" {
  description = "(Optional) Timeouts for the resource operations. Each value must be a string parsable as a Go duration, for example \"30s\", \"5m\" or \"1h30m\".\n\nAny attribute left unset falls back to the timeout default of azurerm_private_dns_resolver_virtual_network_link: create 30m, read 5m, update 30m, delete 30m. The fallbacks live in local.timeouts in locals.tf.\n\nSet the whole object to null to omit the timeouts block entirely and use the AzAPI provider defaults.\n\n- create - (Optional) Timeout for create operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n- delete - (Optional) Timeout for delete operations.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = {}
}

variable "virtual_networks" {
  description = "A map virtual network links to create.\n  - vnet_id - (Required) The ID of the virtual network to link to.\n  - metadata - (Optional) A map of metadata to associate with the virtual network link.\n"
  type = map(object({
    vnet_id = string
  metadata = optional(map(string), null) }))
  default = ""
}
