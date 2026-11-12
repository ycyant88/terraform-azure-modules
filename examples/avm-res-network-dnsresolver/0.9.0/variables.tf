variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "(Optional) Body property paths whose changes the azapi provider ignores after creation, letting an out-of-band controller own those properties without producing perpetual terraform plan drift.\n\nPaths are in dot notation relative to the request body, for example [\"properties.dnsResolverOutboundEndpoints\"].\n\n- network_dns_forwarding_rulesets - (Optional) Ignored body paths for the DNS forwarding rulesets. Default [].\n- network_dns_forwarding_rulesets_forwarding_rules - (Optional) Ignored body paths for the forwarding rules. Default [].\n- network_dns_forwarding_rulesets_virtual_network_links - (Optional) Ignored body paths for both the default and the additional virtual network links. Default [].\n- network_dns_resolvers - (Optional) Ignored body paths for the DNS resolver. Default [].\n- network_dns_resolvers_inbound_endpoints - (Optional) Ignored body paths for the inbound endpoints. Default [].\n- network_dns_resolvers_outbound_endpoints - (Optional) Ignored body paths for the outbound endpoints. Default [].\n- authorization_locks - (Optional) Ignored body paths for resolver and forwarding-ruleset locks. Default [].\n- authorization_role_assignments - (Optional) Ignored body paths for resolver and forwarding-ruleset role assignments. Default [].\n\nWhile a path is ignored, configuration changes at that path are no longer sent to Azure. The value is write-only provider state, so a change only takes effect after an apply, and supplying a non-empty list requires Terraform 1.11 or later. Empty lists are collapsed to null before they reach the provider.\n"
  type = object({
    authorization_locks                                   = optional(list(string), [])
    authorization_role_assignments                        = optional(list(string), [])
    network_dns_forwarding_rulesets                       = optional(list(string), [])
    network_dns_forwarding_rulesets_forwarding_rules      = optional(list(string), [])
    network_dns_forwarding_rulesets_virtual_network_links = optional(list(string), [])
    network_dns_resolvers                                 = optional(list(string), [])
    network_dns_resolvers_inbound_endpoints               = optional(list(string), [])
    network_dns_resolvers_outbound_endpoints              = optional(list(string), [])
  })
  default = {}
}

variable "inbound_endpoints" {
  description = "A map of inbound endpoints to create for this DNS resolver.\n\n- name - (Optional) The name of the inbound endpoint.\n- subnet_name - (Required) The name of the subnet within the virtual network specified by virtual_network_resource_id where the inbound endpoint will be deployed.\n- private_ip_allocation_method - (Optional) The allocation method for the private IP address. Possible values are Dynamic (default) or Static.\n- private_ip_address - (Optional) The static private IP address to assign if private_ip_allocation_method is set to Static.\n- tags - (Optional) A map of tags to assign to the inbound endpoint.\n- merge_with_module_tags - (Optional) Whether to merge the module tags with the inbound endpoint tags. Defaults to true.\n\nMultiple inbound endpoints can be created by providing multiple entries in the map.\n"
  type = map(object({
    name                         = optional(string)
    subnet_name                  = string
    private_ip_allocation_method = optional(string, "Dynamic")
    private_ip_address           = optional(string, null)
    tags                         = optional(map(string), null)
    merge_with_module_tags       = optional(bool, true)
  }))
  default = {}
}

variable "location" {
  description = "Azure region where the resource should be deployed."
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
  description = "The name of the dns resolver."
  type        = string
  default     = ""
}

variable "outbound_endpoints" {
  description = "A map of outbound endpoints to create for this DNS resolver.\n\n- name - (Optional) The name of the outbound endpoint.\n- tags - (Optional) A map of tags to assign to the outbound endpoint.\n- merge_with_module_tags - (Optional) Whether to merge the module tags with the outbound endpoint tags. Defaults to true.\n- subnet_name - (Required) The name of the subnet within the virtual network specified by virtual_network_resource_id where the outbound endpoint will be deployed.\n- forwarding_ruleset - (Optional) A map of forwarding rulesets to create for the outbound endpoint.\n  - name - (Optional) The name of the forwarding ruleset.\n  - link_with_outbound_endpoint_virtual_network - (Optional) Whether to link the forwarding ruleset with the outbound endpoint's virtual network. Defaults to true.\n  - metadata_for_outbound_endpoint_virtual_network_link - (Optional) A map of metadata to associate with the virtual network link.\n  - tags - (Optional) A map of tags to assign to the forwarding ruleset.\n  - merge_with_module_tags - (Optional) Whether to merge the module tags with the forwarding ruleset tags. Defaults to true.\n  - additional_outbound_endpoint_link - (Optional) An object to specify an additional outbound endpoint link.\n    - outbound_endpoint_key - (Optional) The key of another outbound endpoint created in this module. See examples.\n  - additional_virtual_network_links - (Optional) A map of additional virtual network links to create.\n    - name - (Optional) The name of the additional virtual network link.\n    - vnet_id - (Required) The ID of the virtual network to link to.\n    - metadata - (Optional) A map of metadata to associate with the virtual network link.\n  - rules - (Optional) A map of forwarding rules to create for the forwarding ruleset. Defaults to an empty map.\n    - name - (Optional) The name of the forwarding rule.\n    - domain_name - (Required) The domain name to forward.\n    - destination_ip_addresses - (Required) A map where the key is the IP address and the value is the port.\n    - enabled - (Optional) Whether the forwarding rule is enabled. Defaults to true.\n    - metadata - (Optional) A map of metadata to associate with the forwarding rule.\n\nMultiple outbound endpoints can be created by providing multiple entries in the map.\n"
  type = map(object({
    name                   = optional(string)
    tags                   = optional(map(string), null)
    merge_with_module_tags = optional(bool, true)
    subnet_name            = string
    forwarding_ruleset = optional(map(object({
      name                                                = optional(string)
      link_with_outbound_endpoint_virtual_network         = optional(bool, true)
      metadata_for_outbound_endpoint_virtual_network_link = optional(map(string), null)
      tags                                                = optional(map(string), null)
      merge_with_module_tags                              = optional(bool, true)
      additional_outbound_endpoint_link = optional(object({
        outbound_endpoint_key = optional(string)
      }), null)
      additional_virtual_network_links = optional(map(object({
        name     = optional(string)
        vnet_id  = string
        metadata = optional(map(string), null)
      })), {})
      rules = optional(map(object({
        name                     = optional(string)
        domain_name              = string
        destination_ip_addresses = map(string)
        enabled                  = optional(bool, true)
        metadata                 = optional(map(string), null)
      })), {})
    })))
  }))
  default = {}
}

variable "parent_id" {
  description = "The fully-qualified ARM resource ID of the existing resource group into which the DNS resolver and forwarding rulesets will be deployed."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "(Optional) The Azure resource type and API version used for each resource created by this module. Each default is the latest GA API version for that type.\n\n- network_dns_forwarding_rulesets - (Optional) The type and API version of the DNS forwarding rulesets. Default Microsoft.Network/dnsForwardingRulesets@2025-05-01.\n- network_dns_forwarding_rulesets_forwarding_rules - (Optional) The type and API version of the forwarding rules. Default Microsoft.Network/dnsForwardingRulesets/forwardingRules@2025-05-01.\n- network_dns_forwarding_rulesets_virtual_network_links - (Optional) The type and API version of the virtual network links. Default Microsoft.Network/dnsForwardingRulesets/virtualNetworkLinks@2025-05-01.\n- network_dns_resolvers - (Optional) The type and API version of the DNS resolver. Default Microsoft.Network/dnsResolvers@2025-05-01.\n- network_dns_resolvers_inbound_endpoints - (Optional) The type and API version of the inbound endpoints. Default Microsoft.Network/dnsResolvers/inboundEndpoints@2025-05-01.\n- network_dns_resolvers_outbound_endpoints - (Optional) The type and API version of the outbound endpoints. Default Microsoft.Network/dnsResolvers/outboundEndpoints@2025-05-01.\n- authorization_locks - (Optional) The type and API version for resolver and forwarding-ruleset locks. Default Microsoft.Authorization/locks@2020-05-01.\n- authorization_role_assignments - (Optional) The type and API version for resolver and forwarding-ruleset role assignments. Default Microsoft.Authorization/roleAssignments@2022-04-01.\n\nThe lock and role assignment request bodies and names are supplied by the Azure/avm-utl-interfaces/azure module. Their AzAPI resource types use the configurable fields above.\n"
  type = object({
    authorization_locks                                   = optional(string, "Microsoft.Authorization/locks@2020-05-01")
    authorization_role_assignments                        = optional(string, "Microsoft.Authorization/roleAssignments@2022-04-01")
    network_dns_forwarding_rulesets                       = optional(string, "Microsoft.Network/dnsForwardingRulesets@2025-05-01")
    network_dns_forwarding_rulesets_forwarding_rules      = optional(string, "Microsoft.Network/dnsForwardingRulesets/forwardingRules@2025-05-01")
    network_dns_forwarding_rulesets_virtual_network_links = optional(string, "Microsoft.Network/dnsForwardingRulesets/virtualNetworkLinks@2025-05-01")
    network_dns_resolvers                                 = optional(string, "Microsoft.Network/dnsResolvers@2025-05-01")
    network_dns_resolvers_inbound_endpoints               = optional(string, "Microsoft.Network/dnsResolvers/inboundEndpoints@2025-05-01")
    network_dns_resolvers_outbound_endpoints              = optional(string, "Microsoft.Network/dnsResolvers/outboundEndpoints@2025-05-01")
  })
  default = {}
}

variable "retry" {
  description = "(Optional) The retry configuration applied to every azapi_resource created by this module.\n\n- error_message_regex - (Optional) A list of regular expressions matched against the error message. The request is retried when any of them matches. The AzAPI provider requires this attribute, so it cannot be null; pass [] to disable retries.\n- interval_seconds - (Optional) The base number of seconds to wait between retries. Defaults to the AzAPI provider default (10).\n- max_interval_seconds - (Optional) The maximum number of seconds to wait between retries. Defaults to the AzAPI provider default (180).\n\nThe default list covers the transient failures this module's resources actually hit:\n\n- AnotherOperationInProgress - a concurrent write against the same virtual network or subnet.\n- ReferencedResourceNotProvisioned - the subnet or virtual network is still provisioning.\n- CannotDeleteResource - on teardown, ARM still reports a nested resource (an inbound or outbound endpoint, or a forwarding rule) as present after its DELETE has already completed. Matches the default of the AVM AzAPI reference module avm-res-network-privatednszone.\n- PrincipalNotFound - the role assignment principal has not finished propagating through Entra ID. This covers the check that skip_service_principal_aad_check used to handle client-side under hashicorp/azurerm.\n- ScopeLocked - a management lock is still being removed from the scope.\n"
  type = object({
    error_message_regex = optional(list(string), [
      "AnotherOperationInProgress",
      "ReferencedResourceNotProvisioned",
      "CannotDeleteResource",
      "PrincipalNotFound",
      "ScopeLocked",
    ])
    interval_seconds     = optional(number, null)
    max_interval_seconds = optional(number, null)
  })
  default = {}
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the DNS resolver and on each of its forwarding rulesets. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - name - (Optional) The name (a lowercase GUID) of the role assignment on the DNS resolver. If not set, the module derives a GUID from the resolver, principal, role and delegated identity. An adopted assignment keeps its existing GUID on update. A name that you set is used when the assignment is created or replaced, so set a new name if you replace an assignment with a changed principal and want to pick the name yourself. The assignments on the forwarding rulesets always use a derived GUID.\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal. Names are resolved at the resource group of the DNS resolver, including resource-group custom roles and inherited roles. Changing the resolved role on an existing assignment replaces it with a new GUID.\n  - principal_id - The ID of the principal to assign the role to. Changing it on an existing assignment replaces it with a new GUID.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) Preserves the AzureRM request behavior by setting principalType to ServicePrincipal when principal_type is unset. If principal_type is explicitly set, that value takes precedence. A PrincipalNotFound error from a not-yet-replicated principal is retried by var.retry. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. This field is only used in cross-tenant scenarios. Changing it on an existing assignment replaces it with a new GUID.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    name                                   = optional(string, null)
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

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "(Optional) Timeouts for the resource operations. Each value must be a string parsable as a Go duration, for example \"30s\", \"5m\" or \"1h30m\".\n\nAny attribute left unset falls back to the timeout default of the azurerm resource this module replaced. Every replaced resource -- the six azurerm_private_dns_resolver* resources plus azurerm_management_lock and azurerm_role_assignment -- shared the same defaults: create 30m, read 5m, update 30m, delete 30m. The fallbacks live in local.timeouts in locals.tf.\n\nSet the whole object to null to omit the timeouts block entirely and use the AzAPI provider defaults.\n\n- create - (Optional) Timeout for create operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n- delete - (Optional) Timeout for delete operations.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = {}
}

variable "virtual_network_resource_id" {
  description = "The ID of the virtual network to deploy the inbound and outbound endpoints into. The vnet should have appropriate subnets for the endpoints.\nFor more information on how to configure subnets for inbound and outbounbd endpoints, see the modules readme.\n"
  type        = string
  default     = ""
}
