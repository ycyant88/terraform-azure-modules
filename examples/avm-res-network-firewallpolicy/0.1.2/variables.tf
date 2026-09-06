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

variable "firewall_policy_auto_learn_private_ranges_enabled" {
  description = "(Optional) Whether enable auto learn private ip range."
  type        = bool
  default     = null
}

variable "firewall_policy_base_policy_id" {
  description = "(Optional) The ID of the base Firewall Policy."
  type        = string
  default     = null
}

variable "firewall_policy_dns" {
  description = "- proxy_enabled - (Optional) Whether to enable DNS proxy on Firewalls attached to this Firewall Policy? Defaults to false.\n- servers - (Optional) A list of custom DNS servers' IP addresses.\n"
  type = object({
    proxy_enabled = optional(bool)
    servers       = optional(list(string))
  })
  default = null
}

variable "firewall_policy_explicit_proxy" {
  description = "- enable_pac_file - (Optional) Whether the pac file port and url need to be provided.\n- enabled - (Optional) Whether the explicit proxy is enabled for this Firewall Policy.\n- http_port - (Optional) The port number for explicit http protocol.\n- https_port - (Optional) The port number for explicit proxy https protocol.\n- pac_file - (Optional) Specifies a SAS URL for PAC file.\n- pac_file_port - (Optional) Specifies a port number for firewall to serve PAC file.\n"
  type = object({
    enable_pac_file = optional(bool)
    enabled         = optional(bool)
    http_port       = optional(number)
    https_port      = optional(number)
    pac_file        = optional(string)
    pac_file_port   = optional(number)
  })
  default = null
}

variable "firewall_policy_identity" {
  description = "- identity_ids - (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Firewall Policy.\n- type - (Required) Specifies the type of Managed Service Identity that should be configured on this Firewall Policy. Only possible value is UserAssigned.\n"
  type = object({
    identity_ids = optional(set(string))
    type         = string
  })
  default = null
}

variable "firewall_policy_insights" {
  description = "- default_log_analytics_workspace_id - (Required) The ID of the default Log Analytics Workspace that the Firewalls associated with this Firewall Policy will send their logs to, when there is no location matches in the log_analytics_workspace.\n- enabled - (Required) Whether the insights functionality is enabled for this Firewall Policy.\n- retention_in_days - (Optional) The log retention period in days.\n\n---\nlog_analytics_workspace block supports the following:\n- firewall_location - (Required) The location of the Firewalls, that when matches this Log Analytics Workspace will be used to consume their logs.\n- id - (Required) The ID of the Log Analytics Workspace that the Firewalls associated with this Firewall Policy will send their logs to when their locations match the firewall_location.\n"
  type = object({
    default_log_analytics_workspace_id = string
    enabled                            = bool
    retention_in_days                  = optional(number)
    log_analytics_workspace = optional(list(object({
      firewall_location = string
      id                = string
    })))
  })
  default = null
}

variable "firewall_policy_intrusion_detection" {
  description = "- mode - (Optional) In which mode you want to run intrusion detection: Off, Alert or Deny.\n- private_ranges - (Optional) A list of Private IP address ranges to identify traffic direction. By default, only ranges defined by IANA RFC 1918 are considered private IP addresses.\n\n---\nsignature_overrides block supports the following:\n- id - (Optional) 12-digit number (id) which identifies your signature.\n- state - (Optional) state can be any of Off, Alert or Deny.\n\n---\ntraffic_bypass block supports the following:\n- description - (Optional) The description for this bypass traffic setting.\n- destination_addresses - (Optional) Specifies a list of destination IP addresses that shall be bypassed by intrusion detection.\n- destination_ip_groups - (Optional) Specifies a list of destination IP groups that shall be bypassed by intrusion detection.\n- destination_ports - (Optional) Specifies a list of destination IP ports that shall be bypassed by intrusion detection.\n- name - (Required) The name which should be used for this bypass traffic setting.\n- protocol - (Required) The protocols any of ANY, TCP, ICMP, UDP that shall be bypassed by intrusion detection.\n- source_addresses - (Optional) Specifies a list of source addresses that shall be bypassed by intrusion detection.\n- source_ip_groups - (Optional) Specifies a list of source IP groups that shall be bypassed by intrusion detection.\n"
  type = object({
    mode           = optional(string)
    private_ranges = optional(list(string))
    signature_overrides = optional(list(object({
      id    = optional(string)
      state = optional(string)
    })))
    traffic_bypass = optional(list(object({
      description           = optional(string)
      destination_addresses = optional(set(string))
      destination_ip_groups = optional(set(string))
      destination_ports     = optional(set(string))
      name                  = string
      protocol              = string
      source_addresses      = optional(set(string))
      source_ip_groups      = optional(set(string))
    })))
  })
  default = null
}

variable "firewall_policy_private_ip_ranges" {
  description = "(Optional) A list of private IP ranges to which traffic will not be SNAT."
  type        = list(string)
  default     = null
}

variable "firewall_policy_sku" {
  description = "(Optional) The SKU Tier of the Firewall Policy. Possible values are Standard, Premium and Basic. Changing this forces a new Firewall Policy to be created."
  type        = string
  default     = null
}

variable "firewall_policy_sql_redirect_allowed" {
  description = "(Optional) Whether SQL Redirect traffic filtering is allowed. Enabling this flag requires no rule using ports between 11000-11999."
  type        = bool
  default     = null
}

variable "firewall_policy_threat_intelligence_allowlist" {
  description = "- fqdns - (Optional) A list of FQDNs that will be skipped for threat detection.\n- ip_addresses - (Optional) A list of IP addresses or CIDR ranges that will be skipped for threat detection.\n"
  type = object({
    fqdns        = optional(set(string))
    ip_addresses = optional(set(string))
  })
  default = null
}

variable "firewall_policy_threat_intelligence_mode" {
  description = "(Optional) The operation mode for Threat Intelligence. Possible values are Alert, Deny and Off. Defaults to Alert."
  type        = string
  default     = null
}

variable "firewall_policy_timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating the Firewall Policy.\n- delete - (Defaults to 30 minutes) Used when deleting the Firewall Policy.\n- read - (Defaults to 5 minutes) Used when retrieving the Firewall Policy.\n- update - (Defaults to 30 minutes) Used when updating the Firewall Policy.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "firewall_policy_tls_certificate" {
  description = "- key_vault_secret_id - (Required) The ID of the Key Vault, where the secret or certificate is stored.\n- name - (Required) The name of the certificate.\n"
  type = object({
    key_vault_secret_id = string
    name                = string
  })
  default = null
}

variable "location" {
  description = "(Required) The Azure Region where the Firewall Policy should exist. Changing this forces a new Firewall Policy to be created."
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
  description = "(Required) The name which should be used for this Firewall Policy. Changing this forces a new Firewall Policy to be created."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group where the Firewall Policy should exist. Changing this forces a new Firewall Policy to be created."
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
  }))
  default = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
