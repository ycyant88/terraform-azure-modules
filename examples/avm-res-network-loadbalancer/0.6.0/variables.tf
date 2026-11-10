variable "backend_address_pool_addresses" {
  description = "Explicit backend members by stable key. name and backend_address_pool_object_name (pool input key) are required. Supply exactly one of ip_address (IP mode, with optional virtual_network_resource_id overriding pool/default VNet) or load_balancer_frontend_ip_configuration_resource_id (Frontend mode on a Global LB, referencing a public regional LB frontend). Frontend members cannot specify a VNet. A dedicated refreshing pool endpoint owns this authoritative list, including [] for last-member removal. Native NIC memberships require a separate NIC-mode pool and remain owned by the NIC owner."
  type = map(object({
    name                                                = string
    backend_address_pool_object_name                    = string
    ip_address                                          = optional(string)
    virtual_network_resource_id                         = optional(string)
    load_balancer_frontend_ip_configuration_resource_id = optional(string)
  }))
  default = {}
}

variable "backend_address_pool_configuration" {
  description = "Default virtual network resource ID for IP-based backend pools and addresses."
  type        = string
  default     = null
}

variable "backend_address_pools" {
  description = "Backend pools by stable input key: unique name, backend_address_type (NIC default for omission/null, IP, or Frontend), optional virtual_network_resource_id and tunnel_interfaces (identifier, port, protocol, type). The parent owns metadata, not member lists. NIC creates no explicit-member writer or cleanup; membership remains exclusively with the NIC owner. Opt into IP for explicit addresses. Dedicated endpoints authoritatively manage IP/Frontend members, including [] to clear the last member and fixed-empty destroy cleanup. Global pools require explicit Frontend mode and no VNet/tunnels; regional pools require IP or NIC. Modes declare ownership, not an Azure conversion: keep existing IP pools explicitly IP; clear explicit members before switching to NIC; detach native NICs before switching from NIC. Coordinate mode changes separately."
  type = map(object({
    name                        = optional(string, "bepool-1")
    backend_address_type        = optional(string, "NIC")
    virtual_network_resource_id = optional(string)
    tunnel_interfaces = optional(map(object({
      identifier = number
      port       = number
      protocol   = string
      type       = string
    })), {})
  }))
  default = {}
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- logs - (Optional) A set of log entries to send to the destination. Each entry has the following attributes:\n  - category - (Optional) The name of a specific log category to enable. Mutually exclusive with category_group.\n  - category_group - (Optional) The name of a log category group to enable (for example, allLogs or audit). Mutually exclusive with category.\n  - enabled - (Optional) Whether the log entry is enabled. Defaults to true.\n  - retention_policy - (Optional) The retention policy for the log entry.\n    - days - (Optional) The retention period in days. Defaults to 0 (retain indefinitely).\n    - enabled - (Optional) Whether the retention policy is enabled. Defaults to false.\n- metrics - (Optional) A set of metric entries to send to the destination. Each entry has the following attributes:\n  - category - (Optional) The name of the metric category to enable.\n  - enabled - (Optional) Whether the metric entry is enabled. Defaults to true.\n  - retention_policy - (Optional) The retention policy for the metric entry, with the same days and enabled attributes as logs.retention_policy.\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs.\n"
  type = map(object({
    name = optional(string, null)
    logs = optional(set(object({
      category       = optional(string, null)
      category_group = optional(string, null)
      enabled        = optional(bool, true)
      retention_policy = optional(object({
        days    = optional(number, 0)
        enabled = optional(bool, false)
      }), {})
    })), [])
    metrics = optional(set(object({
      category = optional(string, null)
      enabled  = optional(bool, true)
      retention_policy = optional(object({
        days    = optional(number, 0)
        enabled = optional(bool, false)
      }), {})
    })), [])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default = {}
}

variable "edge_zone" {
  description = "Optional edge zone. Changing the edge zone replaces the load balancer."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "frontend_ip_configurations" {
  description = "Frontend configurations keyed by stable consumer keys. name defaults to frontend-<LB name>; names must be unique.\nSupply one of public_ip_address_resource_id, public_ip_prefix_resource_id, or a subnet.\nPIPs are consumer-owned; creation, PIP tags, DNS, DDoS, zones and PIP extension resources belong in that composition.\nPrivate frontends support frontend_private_ip_address, frontend_private_ip_address_allocation (Dynamic/Static),\nfrontend_private_ip_address_version (IPv4/IPv6) and frontend_private_ip_subnet_resource_id.\ngateway_load_balancer_frontend_ip_configuration_id chains a Gateway LB frontend.\nzones defaults to 1/2/3 for private frontends; [\"None\"] omits zones. Public frontends inherit PIP zones.\n"
  type = map(object({
    name                                               = optional(string)
    frontend_private_ip_address                        = optional(string)
    frontend_private_ip_address_version                = optional(string, "IPv4")
    frontend_private_ip_address_allocation             = optional(string, "Dynamic")
    frontend_private_ip_subnet_resource_id             = optional(string)
    gateway_load_balancer_frontend_ip_configuration_id = optional(string)
    public_ip_address_resource_id                      = optional(string)
    public_ip_prefix_resource_id                       = optional(string)
    zones                                              = optional(list(string), ["1", "2", "3"])
  }))
  default = ""
}

variable "frontend_subnet_resource_id" {
  description = "Default subnet resource ID for private frontends."
  type        = string
  default     = null
}

variable "ignore_body_changes" {
  description = "Body-relative dot paths to ignore. Configuration for ignored paths is not sent to Azure; changes take effect after apply.\nList indices are unsupported. All LB child collections are authoritative by default. Ignoring a collection disables management of its configured changes; do not use this to hide convergence defects.\n- network_load_balancers - LB body paths.\n- authorization_locks - Lock paths.\n- authorization_role_assignments - RBAC paths.\n- insights_diagnostic_settings - Diagnostic paths.\n\nAzAPI 2.13 does not support ignore_body_changes on update_resource or resource_action. Dedicated member updates and fixed-empty cleanup therefore do not expose an unsupported ignore argument; their lists remain authoritative.\n"
  type = object({
    network_load_balancers         = optional(list(string), [])
    authorization_locks            = optional(list(string), [])
    authorization_role_assignments = optional(list(string), [])
    insights_diagnostic_settings   = optional(list(string), [])
  })
  default = {}
}

variable "lb_nat_pools" {
  description = "Inline VMSS NAT pools (not deployable ARM subresources). Fields: name, frontend_ip_configuration_name, protocol, frontend_port_start/end, backend_port, idle_timeout_in_minutes, enable_floating_ip and enable_tcp_reset. Mutually exclusive with lb_nat_rules. Prefer NAT v2 rules for new deployments."
  type = map(object({
    name                           = optional(string)
    frontend_ip_configuration_name = string
    protocol                       = optional(string, "Tcp")
    frontend_port_start            = optional(number, 3000)
    frontend_port_end              = optional(number, 3389)
    backend_port                   = optional(number, 3389)
    idle_timeout_in_minutes        = optional(number, 4)
    enable_floating_ip             = optional(bool, false)
    enable_tcp_reset               = optional(bool, false)
  }))
  default = {}
}

variable "lb_nat_rules" {
  description = "Inbound NAT rules by stable input key. Specify name (default nat-rule-<LB name>), frontend_ip_configuration_name, protocol, backend_port, and either frontend_port (v1) or frontend_port_start/end plus a backend pool reference (v2). Supports idle_timeout_in_minutes, enable_floating_ip and enable_tcp_reset."
  type = map(object({
    name                             = optional(string)
    frontend_ip_configuration_name   = string
    protocol                         = optional(string, "Tcp")
    frontend_port                    = optional(number)
    backend_port                     = number
    frontend_port_start              = optional(number)
    frontend_port_end                = optional(number)
    backend_address_pool_resource_id = optional(string)
    backend_address_pool_object_name = optional(string)
    idle_timeout_in_minutes          = optional(number, 4)
    enable_floating_ip               = optional(bool, false)
    enable_tcp_reset                 = optional(bool, false)
  }))
  default = {}
}

variable "lb_outbound_rules" {
  description = "Outbound rules by stable input key. Supply frontend_ip_configurations (list of Azure names), one backend pool resource ID or object key, protocol, enable_tcp_reset, number_of_allocated_outbound_ports and idle_timeout_in_minutes. name defaults to outbound-rule-<LB name>."
  type = map(object({
    name                               = optional(string)
    frontend_ip_configurations         = list(object({ name = string }))
    backend_address_pool_resource_id   = optional(string)
    backend_address_pool_object_name   = optional(string)
    protocol                           = optional(string, "Tcp")
    enable_tcp_reset                   = optional(bool, false)
    number_of_allocated_outbound_ports = optional(number, 1024)
    idle_timeout_in_minutes            = optional(number, 4)
  }))
  default = {}
}

variable "lb_probes" {
  description = "Health probes: unique name (default probe-<LB name>), protocol Tcp/Http/Https, port, interval_in_seconds, number_of_probes_before_removal, probe_threshold and HTTP/S request_path."
  type = map(object({
    name                            = optional(string)
    protocol                        = optional(string, "Tcp")
    port                            = optional(number, 80)
    interval_in_seconds             = optional(number, 15)
    number_of_probes_before_removal = optional(number, 2)
    probe_threshold                 = optional(number, 1)
    request_path                    = optional(string)
  }))
  default = {}
}

variable "lb_rules" {
  description = "Load balancing rules by input key. frontend_ip_configuration_name is an Azure frontend name. Supply backend_address_pool_resource_ids or backend_address_pool_object_names (keys), and optionally probe_resource_id or probe_object_name (key). Supports protocol, frontend_port, backend_port, enable_floating_ip, idle_timeout_in_minutes, load_distribution, disable_outbound_snat and enable_tcp_reset. name defaults to rule-<LB name>."
  type = map(object({
    name                              = optional(string)
    frontend_ip_configuration_name    = string
    protocol                          = optional(string, "Tcp")
    frontend_port                     = optional(number, 3389)
    backend_port                      = optional(number, 3389)
    backend_address_pool_resource_ids = optional(list(string))
    backend_address_pool_object_names = optional(list(string))
    probe_resource_id                 = optional(string)
    probe_object_name                 = optional(string)
    enable_floating_ip                = optional(bool, false)
    idle_timeout_in_minutes           = optional(number, 4)
    load_distribution                 = optional(string, "Default")
    disable_outbound_snat             = optional(bool, false)
    enable_tcp_reset                  = optional(bool, false)
  }))
  default = {}
}

variable "location" {
  description = "The Azure region in which to deploy the load balancer."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n- notes - (Optional) Notes about the lock. This value maps to Microsoft.Authorization/locks.properties.notes.\n"
  type = object({
    kind  = string
    name  = optional(string, null)
    notes = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "The load balancer name. Names are provided by the consumer."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The fully-qualified resource ID of the existing resource group."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions.\n- network_load_balancers - Primary load balancer.\n- network_load_balancers_backend_address_pools - Dedicated member endpoint for exact pre-write actions, refreshing updates and destroy-time clearing.\n- authorization_locks - Resource locks.\n- authorization_role_assignments - RBAC assignments.\n- insights_diagnostic_settings - Diagnostic settings (the API only provides a preview version).\n\nInline LB collections use the parent resource API version.\n"
  type = object({
    network_load_balancers                       = optional(string, "Microsoft.Network/loadBalancers@2025-01-01")
    network_load_balancers_backend_address_pools = optional(string, "Microsoft.Network/loadBalancers/backendAddressPools@2025-01-01")
    authorization_locks                          = optional(string, "Microsoft.Authorization/locks@2020-05-01")
    authorization_role_assignments               = optional(string, "Microsoft.Authorization/roleAssignments@2022-04-01")
    insights_diagnostic_settings                 = optional(string, "Microsoft.Insights/diagnosticSettings@2021-05-01-preview")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to every azapi resource managed by the module (root resource and all submodules). Defaults to null (no custom retry).\n\n- error_message_regex  - (Optional) A list of regex patterns matching error messages that trigger a retry.\n- interval_seconds     - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n\nSee <https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource#retry> for full semantics.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "role_assignments" {
  description = "A map of role assignments to create on the load balancer. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the role assignment. If not set, a random UUID will be generated. Changing this forces the creation of a new resource.\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "sku" {
  description = "Standard or Gateway. Changing SKU replaces the load balancer."
  type        = string
  default     = "Standard"
}

variable "sku_tier" {
  description = "Regional or Global. Changing tier replaces the load balancer."
  type        = string
  default     = "Regional"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Default per-operation timeouts applied to every azapi resource managed by the module. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n\n- create - (Optional) Timeout for create operations.\n- read   - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n- delete - (Optional) Timeout for delete operations.\n\nAzAPI 2.13 resource_action executes destroy-time requests using its create timeout. Configure create for the fixed-empty member cleanup; propagation of delete alone is not a guarantee of cleanup request timeout behavior.\n\nThe stateless exact member pre-write action exposes no retry/timeouts in AzAPI 2.13 and uses its fixed 30-minute timeout. Resource retry and timeout controls do not govern that first PUT.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
