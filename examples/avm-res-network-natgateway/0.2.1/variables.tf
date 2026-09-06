variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "idle_timeout_in_minutes" {
  description = "(Optional) The idle timeout which should be used in minutes. Defaults to 4."
  type        = number
  default     = null
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the NAT Gateway should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n  \n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "(Required) Specifies the name of the NAT Gateway. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "public_ip_configuration" {
  description = "This object describes the public IP configuration when creating Nat Gateway's with a public IP.  If creating more than one public IP, then these values will be used for all public IPs.\n\n- allocation_method       = (Required) - Defines the allocation method for this IP address. Possible values are Static or Dynamic.\n- ddos_protection_mode    = (Optional) - The DDoS protection mode of the public IP. Possible values are Disabled, Enabled, and VirtualNetworkInherited. Defaults to VirtualNetworkInherited.\n- ddos_protection_plan_id = (Optional) - The ID of DDoS protection plan associated with the public IP. ddos_protection_plan_id can only be set when ddos_protection_mode is Enabled\n- domain_name_label       = (Optional) - Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system.\n- idle_timeout_in_minutes = (Optional) - Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes.\n- inherit_tags            = (Optional) - Defaults to false.  Set this to false if only the tags defined on this resource should be applied. - Future functionality leaving in.\n- ip_version              = (Optional) - The IP Version to use, IPv6 or IPv4. Changing this forces a new resource to be created. Only static IP address allocation is supported for IPv6.\n- lock_level              = (Optional) - Set this value to override the resource level lock value.  Possible values are None, CanNotDelete, and ReadOnly.\n- sku                     = (Optional) - The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Standard to support zones by default. Changing this forces a new resource to be created. When sku_tier is set to Global, sku must be set to Standard.\n- sku_tier                = (Optional) - The SKU tier of the Public IP. Accepted values are Global and Regional. Defaults to Regional\n- tags                    = (Optional) - A mapping of tags to assign to the resource.    \n- zones                   = (Optional) - A list of zones where this public IP should be deployed. Defaults to 3 zones. If your region doesn't support zones, then you'll need to set this to null.\n  \n  Example Inputs:\n\nhcl\n#Standard Regional IPV4 Public IP address configuration\npublic_ip_configuration_details = {\n  allocation_method       = \"Static\"\n  ddos_protection_mode    = \"VirtualNetworkInherited\"\n  idle_timeout_in_minutes = 30\n  ip_version              = \"IPv4\"\n  sku_tier                = \"Regional\"\n  sku                     = \"Standard\"\n}\n\n"
  type = object({
    allocation_method       = optional(string, "Static")
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_id = optional(string)
    domain_name_label       = optional(string)
    idle_timeout_in_minutes = optional(number, 30)
    inherit_tags            = optional(bool, false)
    ip_version              = optional(string, "IPv4")
    lock_level              = optional(string, null)
    sku                     = optional(string, "Standard")
    sku_tier                = optional(string, "Regional")
    tags                    = optional(map(string), null)
    zones                   = optional(list(string), ["1", "2", "3"])
  })
  default = { "allocation_method" : "Static", "ddos_protection_mode" : "VirtualNetworkInherited", "idle_timeout_in_minutes" : 30, "ip_version" : "IPv4", "sku" : "Standard", "sku_tier" : "Regional", "zones" : ["1", "2", "3"] }
}

variable "public_ip_prefix_length" {
  description = "(Optional) Public IP-prefix CIDR mask to use. Set to 0 to disable."
  type        = number
  default     = 0
}

variable "public_ips" {
  description = "This map will define between 1 and 16 public IP's to assign to this NAT Gateway. The public_ip_configuration is used to configure common elements across all public IPs.\"\n\n- <map key> - (Required) - The unique arbitrary map key is used by terraform to plan the number of public IP's to create\n  - name - The name to use for this public IP resource\n\nExample Input: \n\nhcl\npublic_ips = {\n  ip_1 = {\n    name = \"nat_gw_pip_1\"\n  }\n}\n\n"
  type = map(object({
    name = string
  }))
  default = {}
}

variable "resource_group_name" {
  description = "(Required) Specifies the name of the Resource Group in which the NAT Gateway should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "sku_name" {
  description = "(Optional) The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard."
  type        = string
  default     = null
}

variable "subnet_associations" {
  description = "This map will define any subnet associations for this nat gateway. The \n\n- <map key> - (Required) - The unique arbitrary map key is used by terraform to plan the number of subnet associations to create\n  - resource_id - (Required) - The Azure Resource ID for the subnet to be associated to this NAT Gateway\n\nExample Input: \n\nhcl\nsubnet_associations = {\n  subnet_1 = {\n    resource_id = azurerm_subnet.example.id\n  }\n}\n\n"
  type = map(object({
    resource_id = string
    }
  ))
  default = {}
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 60 minutes) Used when creating the NAT Gateway.\n- delete - (Defaults to 60 minutes) Used when deleting the NAT Gateway.\n- read - (Defaults to 5 minutes) Used when retrieving the NAT Gateway.\n- update - (Defaults to 60 minutes) Used when updating the NAT Gateway.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "zones" {
  description = "(Optional) A list of Availability Zones in which this NAT Gateway should be located. Changing this forces a new NAT Gateway to be created."
  type        = set(string)
  default     = null
}
