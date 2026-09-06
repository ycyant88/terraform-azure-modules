variable "address_prefix" {
  description = "(Required) The destination to which the route applies. Can be CIDR (such as 10.1.0.0/16) or Azure Service Tag (such as ApiManagement, AzureBackup or AzureMonitor) format."
  type        = string
  default     = ""
}

variable "name" {
  description = "(Required) The name of the route."
  type        = string
  default     = ""
}

variable "next_hop_ip_address" {
  description = "(Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  type        = string
  default     = null
}

variable "next_hop_type" {
  description = "(Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "(Required) The ID of the parent route table resource."
  type        = string
  default     = ""
}
