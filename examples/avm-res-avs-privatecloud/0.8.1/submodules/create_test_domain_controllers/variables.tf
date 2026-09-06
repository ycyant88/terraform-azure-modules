variable "admin_group_name" {
  description = "the username to use for the account used to query ldap."
  type        = string
  default     = "vcenterAdmins"
}

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

variable "dc_dsc_script_url" {
  description = "the github url for the raw DSC configuration script that will be used by the custom script extension."
  type        = string
  default     = "https://raw.githubusercontent.com/Azure/terraform-azurerm-avm-res-avs-privatecloud/main/modules/create_test_domain_controllers/templates/dc_windows_dsc.ps1"
}

variable "dc_dsc_script_url_secondary" {
  description = "the github url for the raw DSC configuration script that will be used by the custom script extension."
  type        = string
  default     = "https://raw.githubusercontent.com/Azure/terraform-azurerm-avm-res-avs-privatecloud/main/modules/create_test_domain_controllers/templates/dc_secondary_windows_dsc.ps1"
}

variable "dc_subnet_resource_id" {
  description = "The Azure Resource ID for the subnet where the DC will be connected."
  type        = string
  default     = ""
}

variable "dc_vm_name" {
  description = "The name of the domain controller virtual machine."
  type        = string
  default     = ""
}

variable "dc_vm_name_secondary" {
  description = "The name of the domain controller virtual machine."
  type        = string
  default     = ""
}

variable "dc_vm_sku" {
  description = "The virtual machine sku size to use for the domain controller.  Defaults to Standard_D2_v4"
  type        = string
  default     = "Standard_D2_v4"
}

variable "domain_distinguished_name" {
  description = "The distinguished name (DN) for the domain to use in ADCS. Defaults to DC=test,DC=local"
  type        = string
  default     = "DC=test,DC=local"
}

variable "domain_fqdn" {
  description = "The fully qualified domain name to use when creating the domain controller. Defaults to test.local"
  type        = string
  default     = "test.local"
}

variable "domain_netbios_name" {
  description = "The Netbios name for the domain.  Default to test."
  type        = string
  default     = "test"
}

variable "key_vault_resource_id" {
  description = "The Azure Resource ID for the key vault where the DSC key and VM passwords will be stored."
  type        = string
  default     = ""
}

variable "ldap_user" {
  description = "the username to use for the account used to query ldap."
  type        = string
  default     = "ldapuser"
}

variable "private_ip_address" {
  description = "The ip address to use for the primary dc"
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

variable "tags" {
  description = "(Optional) Map of tags to be assigned to the AVS resources"
  type        = map(string)
  default     = null
}

variable "test_admin_user" {
  description = "the username to use for the account used to query ldap."
  type        = string
  default     = "testAdmin"
}

variable "virtual_network_resource_id" {
  description = "The resource ID Of the virtual network where the resources are deployed."
  type        = string
  default     = ""
}
