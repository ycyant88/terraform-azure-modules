variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "anonymous_pull_enabled" {
  description = "Specifies whether anonymous (unauthenticated) pull access to this Container Registry is allowed.  Requries Standard or Premium SKU."
  type        = bool
  default     = false
}

variable "customer_managed_key" {
  description = "Controls the Customer managed key configuration on this resource. The following properties can be specified:\n- key_vault_resource_id - (Required) Resource ID of the Key Vault that the customer managed key belongs to.\n- key_name - (Required) Specifies the name of the Customer Managed Key Vault Key.\n- key_version - (Optional) The version of the Customer Managed Key Vault Key.\n- user_assigned_identity - (Optional) The User Assigned Identity that has access to the key.\n  - resource_id - (Required) The resource ID of the User Assigned Identity that has access to the key.\n"
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

variable "data_endpoint_enabled" {
  description = "Specifies whether to enable dedicated data endpoints for this Container Registry.  Requires Premium SKU."
  type        = bool
  default     = false
}

variable "diagnostic_settings" {
  description = "  A map of diagnostic settings to create on the Container Registry. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n  - log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n  - metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
  type = map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "enable_trust_policy" {
  description = "Specified whether trust policy is enabled for this Container Registry."
  type        = bool
  default     = false
}

variable "export_policy_enabled" {
  description = "Specifies whether export policy is enabled. Defaults to true. In order to set it to false, make sure the public_network_access_enabled is also set to false."
  type        = bool
  default     = true
}

variable "georeplications" {
  description = "A list of geo-replication configurations for the Container Registry.\n\n- location - (Required) The geographic location where the Container Registry should be geo-replicated.\n- regional_endpoint_enabled - (Optional) Enables or disables regional endpoint. Defaults to true.\n- zone_redundancy_enabled - (Optional) Enables or disables zone redundancy. Defaults to true.\n- tags - (Optional) A map of additional tags for the geo-replication configuration. Defaults to null.\n\n"
  type = list(object({
    location                  = string
    regional_endpoint_enabled = optional(bool, true)
    zone_redundancy_enabled   = optional(bool, true)
    tags                      = optional(map(any), null)
  }))
  default = []
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

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "The name of the Container Registry."
  type        = string
  default     = ""
}

variable "network_rule_bypass_for_tasks_enabled" {
  description = "Whether to allow Container Registry Tasks to access a network-restricted Container Registry. Defaults to false."
  type        = bool
  default     = false
}

variable "network_rule_bypass_option" {
  description = "Specifies whether to allow trusted Azure services access to a network restricted Container Registry.\nPossible values are None and AzureServices. Defaults to None.\n"
  type        = string
  default     = "None"
}

variable "network_rule_set" {
  description = "The network rule set configuration for the Container Registry.\nRequires Premium SKU.\n\n- default_action - (Optional) The default action when no rule matches. Possible values are Allow and Deny. Defaults to Deny.\n- ip_rules - (Optional) A list of IP rules in CIDR format. Defaults to [].\n  - action - Only \"Allow\" is permitted\n  - ip_range - The CIDR block from which requests will match the rule.\n\n"
  type = object({
    default_action = optional(string, "Deny")
    ip_rule = optional(list(object({
      # since the `action` property only permits `Allow`, this is hard-coded.
      action   = optional(string, "Allow")
      ip_range = string
    })), [])
  })
  default = null
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on the Container Registry. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the Container Registry.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - The name of the IP configuration.\n  - private_ip_address - The private IP address of the IP configuration.\n"
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

variable "private_endpoints_manage_dns_zone_group" {
  description = "Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Specifies whether public access is permitted."
  type        = bool
  default     = true
}

variable "quarantine_policy_enabled" {
  description = "Specifies whether the quarantine policy is enabled."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "retention_policy_in_days" {
  description = "The number of days to retain untagged manifests. Only applicable for Premium SKU.\nSet to null to disable the retention policy. Defaults to 7.\n\n"
  type        = number
  default     = 7
}

variable "role_assignments" {
  description = "A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "scope_maps" {
  description = "A map of scope maps to create on the Container Registry. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- name - The name of the scope map.\n- actions - A list of actions that this scope map can perform. Example: \"repo/content/read\", \"repo2/content/delete\"\n- description - The description of the scope map.\n- registry_tokens - A map of Azure Container Registry token associated to a scope map. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - Specifies the name of the token.\n  - enabled - Should the Container Registry token be enabled? Defaults to true.\n  - passwords - The passwords of the token. The first password is required, the second password is optional.\n    - password1 - The first password of the token.\n      - expiry - The expiry date of the first password. If not specified, the password will not expire.\n    - password2 - The second password of the token.\n      - expiry - The expiry date of the second password. If not specified, the password will not expire.\n"
  type = map(object({
    name        = string
    actions     = list(string)
    description = optional(string, null)
    registry_tokens = optional(map(object({
      name    = string
      enabled = optional(bool, true)
      passwords = optional(object({
        password1 = object({
          expiry = optional(string)
        })
        password2 = optional(object({
          expiry = optional(string)
        }))
      }))
    })))
  }))
  default = {}
}

variable "sku" {
  description = "The SKU name of the Container Registry. Default is Premium. Possible values are Basic, Standard and Premium."
  type        = string
  default     = "Premium"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "zone_redundancy_enabled" {
  description = "Specifies whether zone redundancy is enabled.  Modifying this forces a new resource to be created."
  type        = bool
  default     = true
}
