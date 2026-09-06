variable "disable_bgp_route_propagation" {
  description = "(Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  type        = bool
  default     = true
}

variable "enable_telemetry" {
  description = "    (Optional) This variable controls whether or not telemetry is enabled for the module.\n    For more information see <https://aka.ms/avm/telemetryinfo>.\n    If it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "    (Required) Specifies the supported Azure location for the resource to be deployed. \n    Changing this forces a new resource to be created.\n"
  type        = string
  default     = ""
}

variable "lock" {
  description = "    (Optional) Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n    - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n    - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "(Required) Specifies the name of the Route Table. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "    (Optional) A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n    - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n    - principal_id - The ID of the principal to assign the role to.\n    - description - The description of the role assignment.\n    - skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n    - condition - The condition which will be used to scope the role assignment.\n    - condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n    > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "routes" {
  description = "    (Optional) A map of route objects to create on the route table. \n\n    - name - (Required) The name of the route.\n    - address_prefix - (Required) The destination to which the route applies. Can be CIDR (such as 10.1.0.0/16) or Azure Service Tag (such as ApiManagement, AzureBackup or AzureMonitor) format.\n    - next_hop_type - (Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None.\n    - next_hop_in_ip_address - (Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance\n\n    Example Input:\n\nterraform\nroutes = {\n    route1 = {\n      name           = \"test-route-vnetlocal\"\n      address_prefix = \"10.2.0.0/32\"\n      next_hop_type  = \"VnetLocal\"\n    }\n}\n\n"
  type = map(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default = {}
}

variable "subnet_resource_ids" {
  description = "    (Optional) A map of string subnet ID's to associate the route table to.\n    Each value in the map must be supplied in the form of an Azure resource ID: \nyaml annotate \n/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}/subnets/{subnetName}\n\n\nterraform\nsubnet_resource_ids = {\n    subnet1 = azurerm_subnet.this.id,\n    subnet2 = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}/subnets/{subnetName}\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
