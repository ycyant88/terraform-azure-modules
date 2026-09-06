variable "bastion_name" {
  description = "The name to use for the bastion resource"
  type        = string
  default     = null
}

variable "bastion_pip_name" {
  description = "The name to use for the bastion public IP resource"
  type        = string
  default     = null
}

variable "bastion_subnet_resource_id" {
  description = "The Azure Resource ID for the subnet where the bastion will be connected."
  type        = string
  default     = null
}

variable "create_bastion" {
  description = "Create a bastion resource to use for logging into the domain controller?  Defaults to false."
  type        = bool
  default     = false
}

variable "key_vault_resource_id" {
  description = "The Azure Resource ID for the key vault where the DSC key and VM passwords will be stored."
  type        = string
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

variable "vm_name" {
  description = "The name of the domain controller virtual machine."
  type        = string
  default     = ""
}

variable "vm_sku" {
  description = "The virtual machine sku size to use for the domain controller.  Defaults to Standard_D2_v4"
  type        = string
  default     = "Standard_D2_v4"
}

variable "vm_subnet_resource_id" {
  description = ""
  type        = string
  default     = "The Azure Resource ID for the subnet where the DC will be connected."
}
