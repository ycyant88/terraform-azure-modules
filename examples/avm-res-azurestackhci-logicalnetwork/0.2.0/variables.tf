variable "address_prefix" {
  description = "The CIDR prefix of the subnet that used by kubernetes cluster nodes, it will create VM with the ip address in this range"
  type        = string
  default     = null
}

variable "custom_location_id" {
  description = "The id of the Custom location that used to create hybrid aks"
  type        = string
  default     = ""
}

variable "default_gateway" {
  description = "The default gateway for the network."
  type        = string
  default     = null
}

variable "dns_servers" {
  description = "A list of DNS server IP addresses."
  type        = list(string)
  default     = []
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ending_address" {
  description = "The ending IP address of the IP address range."
  type        = string
  default     = null
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

variable "logical_network_tags" {
  description = "(Optional) Tags of the logical network."
  type        = map(string)
  default     = null
}

variable "name" {
  description = "The name of the logical network"
  type        = string
  default     = ""
}

variable "resource_group_id" {
  description = "The resource group ID for the Azure Stack HCI logical network."
  type        = string
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

variable "route_name" {
  description = "The name of the route"
  type        = string
  default     = "default"
}

variable "starting_address" {
  description = "The starting IP address of the IP address range."
  type        = string
  default     = null
}

variable "subnet_0_name" {
  description = "The name of the subnet"
  type        = string
  default     = "default"
}

variable "vlan_id" {
  description = "The vlan id of the logical network, default means no vlan id is specified"
  type        = string
  default     = null
}

variable "vm_switch_name" {
  description = "The name of the virtual switch that is used by the network."
  type        = string
  default     = ""
}
