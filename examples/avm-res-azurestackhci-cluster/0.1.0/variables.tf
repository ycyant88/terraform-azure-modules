variable "adou_path" {
  description = "The Active Directory OU path."
  type        = string
  default     = ""
}

variable "custom_location_name" {
  description = "The name of the custom location."
  type        = string
  default     = ""
}

variable "default_gateway" {
  description = "The default gateway for the network."
  type        = string
  default     = ""
}

variable "deployment_user" {
  description = "The username for the domain administrator account."
  type        = string
  default     = ""
}

variable "deployment_user_password" {
  description = "The password for the domain administrator account."
  type        = string
  default     = ""
}

variable "dns_servers" {
  description = "A list of DNS server IP addresses."
  type        = list(string)
  default     = ""
}

variable "domain_fqdn" {
  description = "The domain FQDN."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ending_address" {
  description = "The ending IP address of the IP address range."
  type        = string
  default     = ""
}

variable "is_exported" {
  description = "Indicate whether the resource is exported"
  type        = bool
  default     = false
}

variable "keyvault_name" {
  description = "The name of the key vault."
  type        = string
  default     = ""
}

variable "local_admin_password" {
  description = "The password for the local administrator account."
  type        = string
  default     = ""
}

variable "local_admin_user" {
  description = "The username for the local administrator account."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure region where the resource should be deployed."
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

variable "management_adapters" {
  description = "A list of management adapters."
  type        = list(string)
  default     = ""
}

variable "name" {
  description = "The name of the HCI cluster. Must be the same as the name when preparing AD."
  type        = string
  default     = ""
}

variable "random_suffix" {
  description = "Indicate whether to add random suffix"
  type        = bool
  default     = true
}

variable "rdma_enabled" {
  description = "Indicates whether RDMA is enabled."
  type        = bool
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "rp_service_principal_object_id" {
  description = "The object ID of the HCI resource provider service principal."
  type        = string
  default     = ""
}

variable "servers" {
  description = "A list of servers with their names and IPv4 addresses."
  type = list(object({
    name        = string
    ipv4Address = string
  }))
  default = ""
}

variable "service_principal_id" {
  description = "The service principal ID for the Azure account."
  type        = string
  default     = ""
}

variable "service_principal_secret" {
  description = "The service principal secret for the Azure account."
  type        = string
  default     = ""
}

variable "site_id" {
  description = "A unique identifier for the site."
  type        = string
  default     = ""
}

variable "starting_address" {
  description = "The starting IP address of the IP address range."
  type        = string
  default     = ""
}

variable "storage_connectivity_switchless" {
  description = "Indicates whether storage connectivity is switchless."
  type        = bool
  default     = ""
}

variable "storage_networks" {
  description = "A list of storage networks."
  type = list(object({
    name               = string
    networkAdapterName = string
    vlanId             = string
  }))
  default = ""
}

variable "subnet_mask" {
  description = "The subnet mask for the network."
  type        = string
  default     = "255.255.255.0"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "witness_storage_account_name" {
  description = "The name of the witness storage account."
  type        = string
  default     = ""
}
