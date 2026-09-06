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

variable "data_endpoint_enabled" {
  description = "Specifies whether to enable dedicated data endpoints for this Container Registry.  Requires Premium SKU."
  type        = bool
  default     = false
}

variable "diagnostic_settings" {
  description = "  A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n  - log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n  - metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
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
  description = "Azure region where the resource should be deployed.  If null, the location will be inferred from the resource group location."
  type        = string
  default     = null
}

variable "lock" {
  description = "The lock level to apply. Default is None. Possible values are None, CanNotDelete, and ReadOnly."
  type = object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
  default = {}
}

variable "managed_identities" {
  description = "Managed identities to be created for the resource."
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

variable "network_rule_bypass_option" {
  description = "Specifies whether to allow trusted Azure services access to a network restricted Container Registry.  \nPossible values are None and AzureServices. Defaults to None.\n"
  type        = string
  default     = "None"
}

variable "network_rule_set" {
  description = "The network rule set configuration for the Container Registry.\nRequires Premium SKU.\n\n- default_action - (Optional) The default action when no rule matches. Possible values are Allow and Deny. Defaults to Deny.\n- ip_rules - (Optional) A list of IP rules in CIDR format. Defaults to [].\n  - action - Only \"Allow\" is permitted\n  - ip_range - The CIDR block from which requests will match the rule.\n- virtual_network - (Optional) When using with Service Endpoints, a list of subnet IDs to associate with the Container Registry. Defaults to [].\n  - action - Only \"Allow\" is permitted\n  - subnet_id - The subnet id from which requests will match the rule.\n\n"
  type = object({
    default_action = optional(string, "Deny")
    ip_rule = optional(list(object({
      # since the `action` property only permits `Allow`, this is hard-coded.
      action   = optional(string, "Allow")
      ip_range = string
    })), [])
    virtual_network = optional(list(object({
      # since the `action` property only permits `Allow`, this is hard-coded.
      action    = optional(string, "Allow")
      subnet_id = string
    })), [])
  })
  default = null
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
    })), {})
    lock = optional(object({
      name = optional(string, null)
      kind = optional(string, "None")
    }), {})
    tags                                    = optional(map(any), null)
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

variable "retention_policy" {
  description = "If enabled, this retention policy will purge an untagged manifest after a specified number of days.  \n\n- days - (Optional) The number of days before the policy Defaults to 7 days.\n- enabled - (Optional) Whether the retention policy is enabled.  Defaults to false.\n\n"
  type = object({
    days    = optional(number, 7)
    enabled = optional(bool, false)
  })
  default = {}
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
  }))
  default = {}
}

variable "sku" {
  description = "The SKU name of the Container Registry. Default is Premium. Possible values are Basic, Standard and Premium."
  type        = string
  default     = "Premium"
}

variable "tags" {
  description = "The map of tags to be applied to the resource"
  type        = map(any)
  default     = {}
}

variable "zone_redundancy_enabled" {
  description = "Specifies whether zone redundancy is enabled.  Modifying this forces a new resource to be created."
  type        = bool
  default     = true
}
