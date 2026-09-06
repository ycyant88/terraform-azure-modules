variable "container_registry" {
  description = "An object describing the Container Registry. This includes the following properties:\n- resource_id - The resource ID of an existing Container Registry, set to null if a new Container Registry should be created.\n- private_endpoints - A map of private endpoints to create on a newly created Container Registry. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - (Optional) The name of the private endpoint. One will be generated if not set.\n  - subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n  - subresource_name - The name of the subresource.\n  - private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n  - network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n  - inherit_lock - (Optional) If set to true, the private endpoint will inherit the lock from the parent resource. Defaults to false.\n"
  type = object({
    resource_id = optional(string, null)
    create_new  = optional(bool, true)
    private_endpoints = optional(map(object({
      name                            = optional(string, null)
      subnet_resource_id              = optional(string, null)
      subresource_name                = string
      private_dns_zone_resource_ids   = optional(set(string), [])
      private_service_connection_name = optional(string, null)
      network_interface_name          = optional(string, null)
      inherit_lock                    = optional(bool, false)
    })), {})
  })
  default = {}
}

variable "customer_managed_key" {
  description = "A map describing customer-managed keys to associate with the resource. This includes the following properties:\n- key_vault_resource_id - The resource ID of the Key Vault where the key is stored.\n- key_name - The name of the key.\n- key_version - (Optional) The version of the key. If not specified, the latest version is used.\n- user_assigned_identity - (Optional) An object representing a user-assigned identity with the following properties:\n  - resource_id - The resource ID of the user-assigned identity.\n"
  type = object({
    key_vault_resource_id = string
    key_name              = string
    key_version           = optional(string, null)
    user_assigned_identity = optional(object({
      resource_id = string
    }), null)
  })
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "hbi_workspace" {
  description = "Specifies if the resource is a High Business Impact (HBI) workspace."
  type        = bool
  default     = false
}

variable "is_private" {
  description = "Specifies if the resource is private."
  type        = bool
  default     = false
}

variable "key_vault" {
  description = "An object describing the Key Vault to create the private endpoint connection to. This includes the following properties:\n- resource_id - The resource ID of an existing Key Vault, set to null if a new Key Vault should be created.\n- private_endpoints - A map of private endpoints to create on a newly created Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - (Optional) The name of the private endpoint. One will be generated if not set.\n  - subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n  - subresource_name - The name of the subresource.\n  - private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n  - network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n  - inherit_lock - (Optional) If set to true, the private endpoint will inherit the lock from the parent resource. Defaults to false.\n"
  type = object({
    resource_id = optional(string, null)
    create_new  = optional(bool, true)
    private_endpoints = optional(map(object({
      name                            = optional(string, null)
      subnet_resource_id              = optional(string, null)
      subresource_name                = string
      private_dns_zone_resource_ids   = optional(set(string), [])
      private_service_connection_name = optional(string, null)
      network_interface_name          = optional(string, null)
      inherit_lock                    = optional(bool, false)
    })), {})
  })
  default = {}
}

variable "kind" {
  description = "The kind of the resource. This is used to determine the type of the resource. If not specified, the resource will be created as a standard resource.\nPossible values are:\n- Default - The resource will be created as a standard Azure Machine Learning resource.\n- hub - The resource will be created as an AI Hub resource.\n- project - The resource will be created as an AI Studio Project resource.\n"
  type        = string
  default     = "Default"
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

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of this resource.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - The name of the IP configuration.\n  - private_ip_address - The private IP address of the IP configuration.\n"
  type = map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    tags                                    = optional(map(string), null)
    subnet_resource_id                      = string
    subresource_name                        = string
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})
  }))
  default = {}
}

variable "resource_group" {
  description = "An object describing the resource group to deploy the resource to. This includes the following properties:\n- id - The resource ID of the resource group.\n- name - The name of the resource group.\n"
  type = object({
    id   = string
    name = string
  })
  default = ""
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

variable "storage_account" {
  description = "An object describing the Storage Account. This includes the following properties:\n- resource_id - The resource ID of an existing Storage Account, set to null if a new Storage Account should be created.\n- private_endpoints - A map of private endpoints to create on a newly created Storage Account. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - (Optional) The name of the private endpoint. One will be generated if not set.\n  - subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n  - subresource_name - The name of the subresource.\n  - private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n  - network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n  - inherit_lock - (Optional) If set to true, the private endpoint will inherit the lock from the parent resource. Defaults to false.\n"
  type = object({
    resource_id = optional(string, null)
    create_new  = optional(bool, true)
    private_endpoints = optional(map(object({
      name                            = optional(string, null)
      subnet_resource_id              = optional(string, null)
      subresource_name                = string
      private_dns_zone_resource_ids   = optional(set(string), [])
      private_service_connection_name = optional(string, null)
      network_interface_name          = optional(string, null)
      inherit_lock                    = optional(bool, false)
    })), {})
  })
  default = {}
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "vnet" {
  description = "An object describing the Virtual Network to associate with the resource. This includes the following properties:\n- resource_id - The resource ID of the Virtual Network.\n"
  type = object({
    resource_id = optional(string, null)
    create_new  = optional(bool, true)
    subnets = map(object({
      name              = string
      address_prefixes  = list(string)
      service_endpoints = optional(list(string), [])
      nsg_id            = optional(string, null)
    }))
    address_space       = list(string)
    resource_group_name = optional(string, null)
  })
  default = { "address_space" : ["10.0.0.0/22"], "subnets" : { "aisubnet" : { "address_prefixes" : ["10.0.1.0/24"], "name" : "aisubnet" } } }
}
