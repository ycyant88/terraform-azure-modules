variable "app_gateway_waf_policy_resource_id" {
  description = "The ID of the WAF policy to associate with the Application Gateway."
  type        = string
  default     = null
}

variable "autoscale_configuration" {
  description = "V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU"
  type = object({
    min_capacity = optional(number, 1) # Minimum in the range 0 to 100
    max_capacity = optional(number, 2) # Maximum in the range 2 to 125
  })
  default = null
}

variable "backend_address_pools" {
  description = "List of backend address pools"
  type = map(object({
    name         = string
    fqdns        = optional(list(string))
    ip_addresses = optional(list(string))
  }))
  default = ""
}

variable "backend_http_settings" {
  description = "List of backend HTTP settings "
  type = map(object({
    name                                = string
    cookie_based_affinity               = string
    path                                = optional(string)
    affinity_cookie_name                = optional(string)
    enable_https                        = bool
    probe_name                          = optional(string)
    request_timeout                     = number
    host_name                           = optional(string)
    pick_host_name_from_backend_address = optional(bool)
    authentication_certificate = optional(object({
      name = string
    }))
    trusted_root_certificate_names = optional(list(string))
    connection_draining = optional(object({
      enable_connection_draining = bool
      drain_timeout_sec          = number
    }))
  }))
  default = ""
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the ddos protection plan. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "enable_classic_rule" {
  description = "Enable or disable the classic WAF rule"
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetry.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "frontend_ip_type" {
  description = "Type of frontend IP configuration. Possible values: 'public', 'private', 'both'"
  type        = string
  default     = "public"
}

variable "frontend_ports" {
  description = "Map of frontend ports"
  type = map(object({
    name = string
    port = number

  }))
  default = ""
}

variable "http2_enable" {
  description = "The Azure application gateway HTTP/2 protocol support"
  type        = bool
  default     = true
}

variable "http_listeners" {
  description = "List of HTTP listeners"
  type = map(object({
    name               = string
    frontend_port_name = string

    firewall_policy_id   = optional(string)
    require_sni          = optional(bool)
    host_name            = optional(string)
    host_names           = optional(list(string))
    ssl_certificate_name = optional(string)
    ssl_profile_name     = optional(string)
    custom_error_configuration = optional(list(object({
      status_code           = string
      custom_error_page_url = string
    })))
    # Define other attributes as needed
  }))
  default = ""
}

variable "identity_ids" {
  description = "Specifies a list with a single user managed identity id to be assigned to the Application Gateway"
  type        = list(string)
  default     = []
}

variable "location" {
  description = "The Azure regional location where the resources will be deployed."
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
  description = "The name of the application gateway."
  type        = string
  default     = ""
}

variable "private_ip_address" {
  description = "Private IP Address to assign to the Application Gateway Load Balancer."
  type        = string
  default     = null
}

variable "probe_configurations" {
  description = "List of probe configurations."
  type = map(object({
    name                                      = string
    host                                      = string
    interval                                  = number
    timeout                                   = number
    unhealthy_threshold                       = number
    protocol                                  = string
    port                                      = optional(number)
    path                                      = string
    pick_host_name_from_backend_http_settings = optional(bool)
    minimum_servers                           = optional(number)
    match = optional(object({
      body        = optional(string)
      status_code = optional(list(string))
    }))
  }))
  default = null
}

variable "public_ip_name" {
  description = "The name of the application gateway."
  type        = string
  default     = ""
}

variable "redirect_configuration" {
  description = "List of redirection configurations."
  type = map(object({
    name                 = string
    redirect_type        = string
    target_listener_name = optional(string)
    target_url           = optional(string)
    include_path         = optional(bool)
    include_query_string = optional(bool)

  }))
  default = null
}

variable "request_routing_rules" {
  description = "List of request routing rules"
  type = map(object({
    name                        = string
    rule_type                   = string
    http_listener_name          = string
    backend_address_pool_name   = optional(string)
    priority                    = optional(number)
    url_path_map_name           = optional(string)
    backend_http_settings_name  = optional(string)
    redirect_configuration_name = optional(string)
    rewrite_rule_set_name       = optional(string)
    # Define other attributes as needed
  }))
  default = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
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

variable "sku" {
  description = "The application gateway sku and tier."
  type = object({
    name     = string              # Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2
    tier     = string              # Standard, Standard_v2, WAF and WAF_v2
    capacity = optional(number, 2) # V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU
  })
  default = { "capacity" : 2, "name" : "Standard_v2", "tier" : "Standard_v2" }
}

variable "ssl_certificates" {
  description = "List of SSL certificates data for Application gateway"
  type = list(object({
    name                = string
    data                = optional(string)
    password            = optional(string)
    key_vault_secret_id = optional(string)
  }))
  default = []
}

variable "subnet_name_backend" {
  description = "The backend subnet where the applicaiton gateway resources configuration will be deployed."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to apply to the Application Gateway."
  type        = map(string)
  default     = null
}

variable "url_path_map_configurations" {
  description = "List of URL path map configurations."
  type = map(object({
    name                                = string
    default_redirect_configuration_name = optional(string)
    default_rewrite_rule_set_name       = optional(string)
    default_backend_http_settings_name  = optional(string)
    default_backend_address_pool_name   = optional(string)
    path_rules = map(object({
      name                        = string
      paths                       = list(string)
      backend_address_pool_name   = optional(string)
      backend_http_settings_name  = optional(string)
      redirect_configuration_name = optional(string)
      rewrite_rule_set_name       = optional(string)
      firewall_policy_id          = optional(string)
    }))
  }))
  default = null
}

variable "vnet_name" {
  description = "The VNET where the applicaiton gateway resources will be deployed."
  type        = string
  default     = ""
}

variable "waf_configuration" {
  description = "Web Application Firewall (WAF) configuration."
  type = list(object({
    enabled          = bool
    firewall_mode    = string
    rule_set_type    = string
    rule_set_version = string
    # disabled_rule_groups = list(string)
  }))
  default = null
}

variable "zones" {
  description = "The Azure application gateway zone redundancy"
  type        = list(string)
  default     = ["1", "2", "3"]
}
