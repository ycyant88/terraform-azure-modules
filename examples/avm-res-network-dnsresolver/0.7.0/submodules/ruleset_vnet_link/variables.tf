variable "dns_forwarding_ruleset_id" {
  description = "The ID of the DNS forwarding ruleset to link to the virtual networks."
  type        = string
  default     = ""
}

variable "virtual_networks" {
  description = "A map virtual network links to create.\n  - vnet_id - (Required) The ID of the virtual network to link to.\n  - metadata - (Optional) A map of metadata to associate with the virtual network link.\n"
  type = map(object({
    vnet_id = string
  metadata = optional(map(string), null) }))
  default = ""
}
