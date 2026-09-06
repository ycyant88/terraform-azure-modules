variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
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
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "security_rules" {
  description = " - access - (Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny.\n - description - (Optional) A description for this rule. Restricted to 140 characters.\n - destination_address_prefix - (Optional) CIDR or destination IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used. Besides, it also supports all available Service Tags like \u2018Sql.WestEurope\u2018, \u2018Storage.EastUS\u2018, etc. You can list the available service tags with the CLI: shell az network list-service-tags --location westcentralus. For further information please see [Azure CLI\n - destination_address_prefixes - (Optional) List of destination address prefixes. Tags may not be used. This is required if destination_address_prefix is not specified.\n - destination_application_security_group_ids - (Optional) A List of destination Application Security Group IDs\n - destination_port_range - (Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified.\n - destination_port_ranges - (Optional) List of destination ports or port ranges. This is required if destination_port_range is not specified.\n - direction - (Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound.\n - name - (Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group. Changing this forces a new resource to be created.\n - priority - (Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule.\n - protocol - (Required) Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all).\n - source_address_prefix - (Optional) CIDR or source IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used. This is required if source_address_prefixes is not specified.\n - source_address_prefixes - (Optional) List of source address prefixes. Tags may not be used. This is required if source_address_prefix is not specified.\n - source_application_security_group_ids - (Optional) A List of source Application Security Group IDs\n - source_port_range - (Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified.\n - source_port_ranges - (Optional) List of source ports or port ranges. This is required if source_port_range is not specified.\n\n ---\n timeouts block supports the following:\n - create - (Defaults to 30 minutes) Used when creating the Network Security Rule.\n - delete - (Defaults to 30 minutes) Used when deleting the Network Security Rule.\n - read - (Defaults to 5 minutes) Used when retrieving the Network Security Rule.\n - update - (Defaults to 30 minutes) Used when updating the Network Security Rule.\n"
  type = map(object({
    access                                     = string
    description                                = optional(string)
    destination_address_prefix                 = optional(string)
    destination_address_prefixes               = optional(set(string))
    destination_application_security_group_ids = optional(set(string))
    destination_port_range                     = optional(string)
    destination_port_ranges                    = optional(set(string))
    direction                                  = string
    name                                       = string
    priority                                   = number
    protocol                                   = string
    source_address_prefix                      = optional(string)
    source_address_prefixes                    = optional(set(string))
    source_application_security_group_ids      = optional(set(string))
    source_port_range                          = optional(string)
    source_port_ranges                         = optional(set(string))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating the Network Security Group.\n- delete - (Defaults to 30 minutes) Used when deleting the Network Security Group.\n- read - (Defaults to 5 minutes) Used when retrieving the Network Security Group.\n- update - (Defaults to 30 minutes) Used when updating the Network Security Group.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
