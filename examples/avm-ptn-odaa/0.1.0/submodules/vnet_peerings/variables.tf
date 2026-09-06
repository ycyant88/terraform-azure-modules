variable "primary_vnet_name" {
  description = "Name of the source vnet"
  type        = string
  default     = ""
}

variable "primary_vnet_resource_group" {
  description = "Name of the resource group of source vnet"
  type        = string
  default     = ""
}

variable "secondary_vnet_name" {
  description = "Name of the destination vnet"
  type        = string
  default     = ""
}

variable "secondary_vnet_resource_group" {
  description = "Name of the resource group of destination vnet"
  type        = string
  default     = ""
}
