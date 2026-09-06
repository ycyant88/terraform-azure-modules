variable "anf_account_name" {
  description = "ANF NetApp Account Name"
  type        = string
  default     = ""
}

variable "anf_nfs_allowed_clients" {
  description = "A list of CIDR ranges that should be allowed to attach to this Netapp volume"
  type        = list(string)
  default     = ""
}

variable "anf_pool_name" {
  description = "ANF Pool Name"
  type        = string
  default     = ""
}

variable "anf_pool_size" {
  description = "Pool Size in TiB"
  type        = number
  default     = ""
}

variable "anf_subnet_resource_id" {
  description = "The Azure resource ID Of the subnet enabled for Netapp Files."
  type        = string
  default     = ""
}

variable "anf_volume_name" {
  description = "Volume 1 Name"
  type        = string
  default     = ""
}

variable "anf_volume_size" {
  description = "Volume 1 Size in GiB"
  type        = number
  default     = ""
}

variable "anf_zone_number" {
  description = "The zone where the ANF volume should be deployed."
  type        = number
  default     = ""
}

variable "resource_group_location" {
  description = "The region for the resource group where the dc will be installed."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The name of the resource group where the dc will be installed."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Map of tags to be assigned to the AVS resources"
  type        = map(string)
  default     = null
}
