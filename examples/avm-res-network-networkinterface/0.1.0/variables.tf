variable "accelerated_networking_enabled" {
  description = "(Optional) Specifies whether accelerated networking should be enabled on the network interface or not."
  type        = bool
  default     = false
}

variable "application_gateway_backend_address_pool_association" {
  description = "An object describing the application gateway to associate with the resource. This includes the following properties:\n- application_gateway_backend_address_pool_id - The resource ID of the application gateway backend address pool.\n- ip_configuration_name - The name of the network interface IP configuration.\n"
  type = object({
    application_gateway_backend_address_pool_id = string
    ip_configuration_name                       = string
  })
  default = null
}

variable "application_security_group_ids" {
  description = "(Optional) List of application security group IDs."
  type        = list(string)
  default     = null
}

variable "dns_servers" {
  description = "(Optional) Specifies a list of IP addresses representing DNS servers."
  type        = list(string)
  default     = null
}

variable "edge_zone" {
  description = "(Optional) Specifies the extended location of the network interface."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "internal_dns_name_label" {
  description = "(Optional) The (relative) DNS Name used for internal communications between virtual machines in the same virtual network."
  type        = string
  default     = null
}

variable "ip_configurations" {
  description = "A map of ip configurations for the network interface. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time."
  type = map(object({
    name                                               = string
    gateway_load_balancer_frontend_ip_configuration_id = optional(string, null)
    subnet_id                                          = string
    private_ip_address_version                         = optional(string, "IPv4")
    private_ip_address_allocation                      = optional(string, "Dynamic")
    public_ip_address_id                               = optional(string, null)
    primary                                            = optional(bool, null)
    private_ip_address                                 = optional(string, null)
  }))
  default = ""
}

variable "ip_forwarding_enabled" {
  description = "(Optional) Specifies whether IP forwarding should be enabled on the network interface or not."
  type        = bool
  default     = false
}

variable "load_balancer_backend_address_pool_association" {
  description = "A map of object describing the load balancer to associate with the resource. This includes the following properties:\n- load_balancer_backend_address_pool_id - The resource ID of the load balancer backend address pool.\n- ip_configuration_name - The name of the network interface IP configuration.\n"
  type = map(object({
    load_balancer_backend_address_pool_id = string
    ip_configuration_name                 = string
  }))
  default = null
}

variable "location" {
  description = "The Azure location where the network interface should exist."
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
  description = "The name of the network interface."
  type        = string
  default     = ""
}

variable "nat_rule_association" {
  description = "A map describing the NAT rule to associate with the resource. This includes the following properties:\n- nat_rule_id - The resource ID of the NAT rule.\n- ip_configuration_name - The name of the network interface IP configuration.\n"
  type = map(object({
    nat_rule_id           = string
    ip_configuration_name = string
  }))
  default = {}
}

variable "network_security_group_ids" {
  description = "(Optional) List of network security group IDs."
  type        = list(string)
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the network interface."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags to assign to the network interface."
  type        = map(string)
  default     = null
}
