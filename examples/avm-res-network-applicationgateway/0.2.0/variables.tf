variable "app_gateway_waf_policy_resource_id" {
  description = "(Optional) The ID of the Web Application Firewall Policy."
  type        = string
  default     = null
}

variable "authentication_certificate" {
  description = "- data - (Required) The contents of the Authentication Certificate which should be used.\n- name - (Required) The Name of the Authentication Certificate to use.\n"
  type = map(object({
    data = string
    name = string
  }))
  default = null
}

variable "autoscale_configuration" {
  description = "- max_capacity - (Optional) Maximum capacity for autoscaling. Accepted values are in the range 2 to 125.\n- min_capacity - (Required) Minimum capacity for autoscaling. Accepted values are in the range 0 to 100.\n"
  type = object({
    min_capacity = optional(number, 1) # Minimum in the range 0 to 100
    max_capacity = optional(number, 2) # Maximum in the range 2 to 125
  })
  default = null
}

variable "backend_address_pools" {
  description = "- name - (Required) The name of the Backend Address Pool.\n- fqdns - (Optional) A list of FQDN's which should be part of the Backend Address Pool.\n- ip_addresses - (Optional) A list of IP Addresses which should be part of the Backend Address Pool.\n"
  type = map(object({
    name         = string
    fqdns        = optional(set(string))
    ip_addresses = optional(set(string))
  }))
  default = ""
}

variable "backend_http_settings" {
  description = "- cookie_based_affinity - (Required) Is Cookie-Based Affinity enabled? Possible values are Enabled and Disabled.\n- name - (Required) The name of the Backend HTTP Settings Collection.\n- port - (Required) The port which should be used for this Backend HTTP Settings Collection.\n- protocol - (Required) The Protocol which should be used. Possible values are Http and Https.\n- affinity_cookie_name - (Optional) The name of the affinity cookie.\n- host_name - (Optional) Host header to be sent to the backend servers. Cannot be set if pick_host_name_from_backend_address is set to true.\n- path - (Optional) The Path which should be used as a prefix for all HTTP requests.\n- pick_host_name_from_backend_address - (Optional) Whether host header should be picked from the host name of the backend server. Defaults to false.\n- probe_name - (Optional) The name of an associated HTTP Probe.\n- request_timeout - (Optional) The request timeout in seconds, which must be between 1 and 86400 seconds. Defaults to 30.\n- trusted_root_certificate_names - (Optional) A list of trusted_root_certificate names.\n\n---\nauthentication_certificate block supports the following:\n- name - (Required) The Name of the Authentication Certificate to use.\n\n---\nconnection_draining block supports the following:\n- drain_timeout_sec - (Required) The number of seconds connection draining is active. Acceptable values are from 1 second to 3600 seconds.\n- enable_connection_draining - (Required) If connection draining is enabled or not.\n"
  type = map(object({
    cookie_based_affinity               = optional(string, "Disabled")
    name                                = string
    port                                = number
    protocol                            = string
    affinity_cookie_name                = optional(string)
    host_name                           = optional(string)
    path                                = optional(string)
    pick_host_name_from_backend_address = optional(bool)
    probe_name                          = optional(string)
    request_timeout                     = optional(number)
    trusted_root_certificate_names      = optional(list(string))
    authentication_certificate = optional(list(object({
      name = string
    })))
    connection_draining = optional(object({
      drain_timeout_sec          = number
      enable_connection_draining = bool
    }))
  }))
  default = ""
}

variable "custom_error_configuration" {
  description = "- custom_error_page_url - (Required) Error page URL of the application gateway customer error.\n- status_code - (Required) Status code of the application gateway customer error. Possible values are HttpStatus403 and HttpStatus502\n"
  type = map(object({
    custom_error_page_url = string
    status_code           = string
  }))
  default = null
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

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetry.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "fips_enabled" {
  description = "(Optional) Is FIPS enabled on the Application Gateway?"
  type        = bool
  default     = null
}

variable "frontend_ip_configuration_private" {
  description = " - private_name - (Optional) The name of the private  Frontend IP Configuration. \n - private_ip_address - (Optional) The Private IP Address to use for the Application Gateway.\n - private_ip_address_allocation - (Optional) The Allocation Method for the Private IP Address. Possible values are Dynamic and Static. Defaults to Dynamic.\n - private_link_configuration_name - (Optional) The name of the private link configuration to use for this frontend IP configuration.\n\nThe subnet id must be the same as supplied to the gateway configuration so is not required as a parameter.\n\n"
  type = object({
    name                            = optional(string)
    private_ip_address              = optional(string)
    private_ip_address_allocation   = optional(string)
    private_link_configuration_name = optional(string)
  })
  default = {}
}

variable "frontend_ip_configuration_public_name" {
  description = "(Optional) The name of the public Frontend IP Configuration.  If not supplied will be inferred from the resource name."
  type        = string
  default     = null
}

variable "frontend_ports" {
  description = "- name - (Required) The name of the Frontend Port.\n- port - (Required) The port used for this Frontend Port.\n"
  type = map(object({
    name = string
    port = number
  }))
  default = ""
}

variable "gateway_ip_configuration" {
  description = "- name - (Required) The Name of this Gateway IP Configuration.\n- subnet_id - (Required) The ID of the Subnet which the Application Gateway should be connected to.\n"
  type = object({
    name      = optional(string)
    subnet_id = string
  })
  default = ""
}

variable "global" {
  description = "- request_buffering_enabled - (Required) Whether Application Gateway's Request buffer is enabled.\n- response_buffering_enabled - (Required) Whether Application Gateway's Response buffer is enabled.\n"
  type = object({
    request_buffering_enabled  = bool
    response_buffering_enabled = bool
  })
  default = null
}

variable "http2_enable" {
  description = "The Azure application gateway HTTP/2 protocol support"
  type        = bool
  default     = true
}

variable "http_listeners" {
  description = "- firewall_policy_id - (Optional) The ID of the Web Application Firewall Policy which should be used for this HTTP Listener.\n- frontend_ip_configuration_name - (Required) The Name of the Frontend IP Configuration used for this HTTP Listener.\n- frontend_port_name - (Required) The Name of the Frontend Port use for this HTTP Listener.\n- host_name - (Optional) The Hostname which should be used for this HTTP Listener. Setting this value changes Listener Type to 'Multi site'.\n- host_names - (Optional) A list of Hostname(s) should be used for this HTTP Listener. It allows special wildcard characters.\n- name - (Required) The Name of the HTTP Listener.\n- protocol - (Required) The Protocol to use for this HTTP Listener. Possible values are Http and Https.\n- require_sni - (Optional) Should Server Name Indication be Required? Defaults to false.\n- ssl_certificate_name - (Optional) The name of the associated SSL Certificate which should be used for this HTTP Listener.\n- ssl_profile_name - (Optional) The name of the associated SSL Profile which should be used for this HTTP Listener.\n\n---\ncustom_error_configuration block supports the following:\n- custom_error_page_url - (Required) Error page URL of the application gateway customer error.\n- status_code - (Required) Status code of the application gateway customer error. Possible values are HttpStatus403 and HttpStatus502\n"
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

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "The name of the application gateway."
  type        = string
  default     = ""
}

variable "private_link_configuration" {
  description = "- name - (Required) The name of the private link configuration.\n\n---\nip_configuration block supports the following:\n- name - (Required) The name of the IP configuration.\n- primary - (Required) Is this the Primary IP Configuration?\n- private_ip_address - (Optional) The Static IP Address which should be used.\n- private_ip_address_allocation - (Required) The allocation method used for the Private IP Address. Possible values are Dynamic and Static.\n- subnet_id - (Required) The ID of the subnet the private link configuration should connect to.\n"
  type = set(object({
    name = string
    ip_configuration = list(object({
      name                          = string
      primary                       = bool
      private_ip_address            = optional(string)
      private_ip_address_allocation = string
      subnet_id                     = string
    }))
  }))
  default = null
}

variable "probe_configurations" {
  description = "- host - (Optional) The Hostname used for this Probe. If the Application Gateway is configured for a single site, by default the Host name should be specified as 127.0.0.1, unless otherwise configured in custom probe. Cannot be set if pick_host_name_from_backend_http_settings is set to true.\n- interval - (Required) The Interval between two consecutive probes in seconds. Possible values range from 1 second to a maximum of 86,400 seconds.\n- minimum_servers - (Optional) The minimum number of servers that are always marked as healthy. Defaults to 0.\n- name - (Required) The Name of the Probe.\n- path - (Required) The Path used for this Probe.\n- pick_host_name_from_backend_http_settings - (Optional) Whether the host header should be picked from the backend HTTP settings. Defaults to false.\n- port - (Optional) Custom port which will be used for probing the backend servers. The valid value ranges from 1 to 65535. In case not set, port from HTTP settings will be used. This property is valid for Standard_v2 and WAF_v2 only.\n- protocol - (Required) The Protocol used for this Probe. Possible values are Http and Https.\n- timeout - (Required) The Timeout used for this Probe, which indicates when a probe becomes unhealthy. Possible values range from 1 second to a maximum of 86,400 seconds.\n- unhealthy_threshold - (Required) The Unhealthy Threshold for this Probe, which indicates the amount of retries which should be attempted before a node is deemed unhealthy. Possible values are from 1 to 20.\n\n---\nmatch block supports the following:\n- body - (Optional) A snippet from the Response Body which must be present in the Response.\n- status_code - (Required) A list of allowed status codes for this Health Probe.\n"
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
  description = "- include_path - (Optional) Whether to include the path in the redirected URL. Defaults to false\n- include_query_string - (Optional) Whether to include the query string in the redirected URL. Default to false\n- name - (Required) Unique name of the redirect configuration block\n- redirect_type - (Required) The type of redirect. Possible values are Permanent, Temporary, Found and SeeOther\n- target_listener_name - (Optional) The name of the listener to redirect to. Cannot be set if target_url is set.\n- target_url - (Optional) The URL to redirect the request to. Cannot be set if target_listener_name is set.\n"
  type = map(object({
    include_path         = optional(bool)
    include_query_string = optional(bool)
    name                 = string
    redirect_type        = string
    target_listener_name = optional(string)
    target_url           = optional(string)
  }))
  default = null
}

variable "request_routing_rules" {
  description = "- backend_address_pool_name - (Optional) The Name of the Backend Address Pool which should be used for this Routing Rule. Cannot be set if redirect_configuration_name is set.\n- backend_http_settings_name - (Optional) The Name of the Backend HTTP Settings Collection which should be used for this Routing Rule. Cannot be set if redirect_configuration_name is set.\n- http_listener_name - (Required) The Name of the HTTP Listener which should be used for this Routing Rule.\n- name - (Required) The Name of this Request Routing Rule.\n- priority - (Optional) Rule evaluation order can be dictated by specifying an integer value from 1 to 20000 with 1 being the highest priority and 20000 being the lowest priority.\n- redirect_configuration_name - (Optional) The Name of the Redirect Configuration which should be used for this Routing Rule. Cannot be set if either backend_address_pool_name or backend_http_settings_name is set.\n- rewrite_rule_set_name - (Optional) The Name of the Rewrite Rule Set which should be used for this Routing Rule. Only valid for v2 SKUs.\n- rule_type - (Required) The Type of Routing that should be used for this Rule. Possible values are Basic and PathBasedRouting.\n- url_path_map_name - (Optional) The Name of the URL Path Map which should be associated with this Routing Rule.\n"
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

variable "rewrite_rule_set" {
  description = "- name - (Required) Unique name of the rewrite rule set block\n\n---\nrewrite_rules block supports the following:\n- name - (Required) Unique name of the rewrite rule block\n- rule_sequence - (Required) Rule sequence of the rewrite rule that determines the order of execution in a set.\n\n  ---\n  condition block supports the following:\n  - ignore_case - (Optional) Perform a case in-sensitive comparison. Defaults to false\n  - negate - (Optional) Negate the result of the condition evaluation. Defaults to false\n  - pattern - (Required) The pattern, either fixed string or regular expression, that evaluates the truthfulness of the condition.\n  - variable - (Required) The [variable](https://docs.microsoft.com/azure/application-gateway/rewrite-http-headers#server-variables) of the condition.\n\n  ---\n  request_header_configuration block supports the following:\n  - header_name - (Required) Header name of the header configuration.\n  - header_value - (Required) Header value of the header configuration. To delete a request header set this property to an empty string.\n\n  ---\n  response_header_configuration block supports the following:\n  - header_name - (Required) Header name of the header configuration.\n  - header_value - (Required) Header value of the header configuration. To delete a response header set this property to an empty string.\n\n  ---\n  url block supports the following:\n  - components - (Optional) The components used to rewrite the URL. Possible values are path_only and query_string_only to limit the rewrite to the URL Path or URL Query String only.\n  - path - (Optional) The URL path to rewrite.\n  - query_string - (Optional) The query string to rewrite.\n  - reroute - (Optional) Whether the URL path map should be reevaluated after this rewrite has been applied. [More info on rewrite configuration](https://docs.microsoft.com/azure/application-gateway/rewrite-http-headers-url#rewrite-configuration)\n"
  type = map(object({
    name = string
    rewrite_rules = optional(map(object({
      name          = string
      rule_sequence = number
      conditions = optional(map(object({
        ignore_case = optional(bool)
        negate      = optional(bool)
        pattern     = string
        variable    = string
      })))
      request_header_configurations = optional(map(object({
        header_name  = string
        header_value = string
      })))
      response_header_configurations = optional(map(object({
        header_name  = string
        header_value = string
      })))
      url = optional(object({
        components   = optional(string)
        path         = optional(string)
        query_string = optional(string)
        reroute      = optional(bool)
      }))
    })))
  }))
  default = null
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
  description = "- name - (Required) The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2.\n- tier - (Required) The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2.\n- capacity - (Optional) The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU. This property is optional if autoscale_configuration is set.\n"
  type = object({
    name     = string              # Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2
    tier     = string              # Standard, Standard_v2, WAF and WAF_v2
    capacity = optional(number, 2) # V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU
  })
  default = { "capacity" : 2, "name" : "Standard_v2", "tier" : "Standard_v2" }
}

variable "ssl_certificates" {
  description = "- data - (Optional) The base64-encoded PFX certificate data. Required if key_vault_secret_id is not set.\n- key_vault_secret_id - (Optional) The Secret ID of (base-64 encoded unencrypted pfx) the Secret or Certificate object stored in Azure KeyVault. You need to enable soft delete for Key Vault to use this feature. Required if data is not set.\n- name - (Required) The Name of the SSL certificate that is unique within this Application Gateway\n- password - (Optional) Password for the pfx file specified in data. Required if data is set.\n"
  type = map(object({
    name                = string
    data                = optional(string)
    password            = optional(string)
    key_vault_secret_id = optional(string)
  }))
  default = null
}

variable "ssl_policy" {
  description = "- cipher_suites - (Optional) A List of accepted cipher suites. Possible values are: TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA, TLS_DHE_DSS_WITH_AES_128_CBC_SHA, TLS_DHE_DSS_WITH_AES_128_CBC_SHA256, TLS_DHE_DSS_WITH_AES_256_CBC_SHA, TLS_DHE_DSS_WITH_AES_256_CBC_SHA256, TLS_DHE_RSA_WITH_AES_128_CBC_SHA, TLS_DHE_RSA_WITH_AES_128_GCM_SHA256, TLS_DHE_RSA_WITH_AES_256_CBC_SHA, TLS_DHE_RSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384, TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384, TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384, TLS_RSA_WITH_3DES_EDE_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA256, TLS_RSA_WITH_AES_128_GCM_SHA256, TLS_RSA_WITH_AES_256_CBC_SHA, TLS_RSA_WITH_AES_256_CBC_SHA256 and TLS_RSA_WITH_AES_256_GCM_SHA384.\n- disabled_protocols - (Optional) A list of SSL Protocols which should be disabled on this Application Gateway. Possible values are TLSv1_0, TLSv1_1, TLSv1_2 and TLSv1_3.\n- min_protocol_version - (Optional) The minimal TLS version. Possible values are TLSv1_0, TLSv1_1, TLSv1_2 and TLSv1_3.\n- policy_name - (Optional) The Name of the Policy e.g. AppGwSslPolicy20170401S. Required if policy_type is set to Predefined. Possible values can change over time and are published here <https://docs.microsoft.com/azure/application-gateway/application-gateway-ssl-policy-overview>. Not compatible with disabled_protocols.\n- policy_type - (Optional) The Type of the Policy. Possible values are Predefined, Custom and CustomV2.\n"
  type = object({
    cipher_suites        = optional(list(string))
    disabled_protocols   = optional(list(string))
    min_protocol_version = optional(string)
    policy_name          = optional(string)
    policy_type          = optional(string)
  })
  default = null
}

variable "ssl_profile" {
  description = "- name - (Required) The name of the SSL Profile that is unique within this Application Gateway.\n- trusted_client_certificate_names - (Optional) The name of the Trusted Client Certificate that will be used to authenticate requests from clients.\n- verify_client_cert_issuer_dn - (Optional) Should client certificate issuer DN be verified? Defaults to false.\n- verify_client_certificate_revocation - (Optional) Specify the method to check client certificate revocation status. Possible value is OCSP.\n\n---\nssl_policy block supports the following:\n- cipher_suites - (Optional) A List of accepted cipher suites. Possible values are: TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA, TLS_DHE_DSS_WITH_AES_128_CBC_SHA, TLS_DHE_DSS_WITH_AES_128_CBC_SHA256, TLS_DHE_DSS_WITH_AES_256_CBC_SHA, TLS_DHE_DSS_WITH_AES_256_CBC_SHA256, TLS_DHE_RSA_WITH_AES_128_CBC_SHA, TLS_DHE_RSA_WITH_AES_128_GCM_SHA256, TLS_DHE_RSA_WITH_AES_256_CBC_SHA, TLS_DHE_RSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384, TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384, TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384, TLS_RSA_WITH_3DES_EDE_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA256, TLS_RSA_WITH_AES_128_GCM_SHA256, TLS_RSA_WITH_AES_256_CBC_SHA, TLS_RSA_WITH_AES_256_CBC_SHA256 and TLS_RSA_WITH_AES_256_GCM_SHA384.\n- disabled_protocols - (Optional) A list of SSL Protocols which should be disabled on this Application Gateway. Possible values are TLSv1_0, TLSv1_1, TLSv1_2 and TLSv1_3.\n- min_protocol_version - (Optional) The minimal TLS version. Possible values are TLSv1_0, TLSv1_1, TLSv1_2 and TLSv1_3.\n- policy_name - (Optional) The Name of the Policy e.g. AppGwSslPolicy20170401S. Required if policy_type is set to Predefined. Possible values can change over time and are published here <https://docs.microsoft.com/azure/application-gateway/application-gateway-ssl-policy-overview>. Not compatible with disabled_protocols.\n- policy_type - (Optional) The Type of the Policy. Possible values are Predefined, Custom and CustomV2.\n"
  type = map(object({
    name                                 = string
    trusted_client_certificate_names     = optional(list(string))
    verify_client_cert_issuer_dn         = optional(bool)
    verify_client_certificate_revocation = optional(string)
    ssl_policy = optional(object({
      cipher_suites        = optional(list(string))
      disabled_protocols   = optional(list(string))
      min_protocol_version = optional(string)
      policy_name          = optional(string)
      policy_type          = optional(string)
    }))
  }))
  default = null
}

variable "tags" {
  description = "A map of tags to apply to the Application Gateway."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 90 minutes) Used when creating the Application Gateway.\n- delete - (Defaults to 90 minutes) Used when deleting the Application Gateway.\n- read - (Defaults to 5 minutes) Used when retrieving the Application Gateway.\n- update - (Defaults to 90 minutes) Used when updating the Application Gateway.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "trusted_client_certificate" {
  description = "- data - (Required) The base-64 encoded certificate.\n- name - (Required) The name of the Trusted Client Certificate that is unique within this Application Gateway.\n"
  type = map(object({
    data = string
    name = string
  }))
  default = null
}

variable "trusted_root_certificate" {
  description = "- data - (Optional) The contents of the Trusted Root Certificate which should be used. Required if key_vault_secret_id is not set.\n- key_vault_secret_id - (Optional) The Secret ID of (base-64 encoded unencrypted pfx) Secret or Certificate object stored in Azure KeyVault. You need to enable soft delete for the Key Vault to use this feature. Required if data is not set.\n- name - (Required) The Name of the Trusted Root Certificate to use.\n"
  type = map(object({
    data                = optional(string)
    key_vault_secret_id = optional(string)
    name                = string
  }))
  default = null
}

variable "url_path_map_configurations" {
  description = "- default_backend_address_pool_name - (Optional) The Name of the Default Backend Address Pool which should be used for this URL Path Map. Cannot be set if default_redirect_configuration_name is set.\n- default_backend_http_settings_name - (Optional) The Name of the Default Backend HTTP Settings Collection which should be used for this URL Path Map. Cannot be set if default_redirect_configuration_name is set.\n- default_redirect_configuration_name - (Optional) The Name of the Default Redirect Configuration which should be used for this URL Path Map. Cannot be set if either default_backend_address_pool_name or default_backend_http_settings_name is set.\n- default_rewrite_rule_set_name - (Optional) The Name of the Default Rewrite Rule Set which should be used for this URL Path Map. Only valid for v2 SKUs.\n- name - (Required) The Name of the URL Path Map.\n\n---\npath_rule block supports the following:\n- backend_address_pool_name - (Optional) The Name of the Backend Address Pool to use for this Path Rule. Cannot be set if redirect_configuration_name is set.\n- backend_http_settings_name - (Optional) The Name of the Backend HTTP Settings Collection to use for this Path Rule. Cannot be set if redirect_configuration_name is set.\n- firewall_policy_id - (Optional) The ID of the Web Application Firewall Policy which should be used as an HTTP Listener.\n- name - (Required) The Name of the Path Rule.\n- paths - (Required) A list of Paths used in this Path Rule.\n- redirect_configuration_name - (Optional) The Name of a Redirect Configuration to use for this Path Rule. Cannot be set if backend_address_pool_name or backend_http_settings_name is set.\n- rewrite_rule_set_name - (Optional) The Name of the Rewrite Rule Set which should be used for this URL Path Map. Only valid for v2 SKUs.\n"
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

variable "waf_configuration" {
  description = "- enabled - (Required) Is the Web Application Firewall enabled?\n- file_upload_limit_mb - (Optional) The File Upload Limit in MB. Accepted values are in the range 1MB to 750MB for the WAF_v2 SKU, and 1MB to 500MB for all other SKUs. Defaults to 100MB.\n- firewall_mode - (Required) The Web Application Firewall Mode. Possible values are Detection and Prevention.\n- max_request_body_size_kb - (Optional) The Maximum Request Body Size in KB. Accepted values are in the range 1KB to 128KB. Defaults to 128KB.\n- request_body_check - (Optional) Is Request Body Inspection enabled? Defaults to true.\n- rule_set_type - (Optional) The Type of the Rule Set used for this Web Application Firewall. Possible values are OWASP, Microsoft_BotManagerRuleSet and Microsoft_DefaultRuleSet. Defaults to OWASP.\n- rule_set_version - (Required) The Version of the Rule Set used for this Web Application Firewall. Possible values are 0.1, 1.0, 2.1, 2.2.9, 3.0, 3.1 and 3.2.\n\n---\ndisabled_rule_group block supports the following:\n- rule_group_name - (Required) The rule group where specific rules should be disabled. Possible values are BadBots, crs_20_protocol_violations, crs_21_protocol_anomalies, crs_23_request_limits, crs_30_http_policy, crs_35_bad_robots, crs_40_generic_attacks, crs_41_sql_injection_attacks, crs_41_xss_attacks, crs_42_tight_security, crs_45_trojans, crs_49_inbound_blocking, General, GoodBots, KnownBadBots, Known-CVEs, REQUEST-911-METHOD-ENFORCEMENT, REQUEST-913-SCANNER-DETECTION, REQUEST-920-PROTOCOL-ENFORCEMENT, REQUEST-921-PROTOCOL-ATTACK, REQUEST-930-APPLICATION-ATTACK-LFI, REQUEST-931-APPLICATION-ATTACK-RFI, REQUEST-932-APPLICATION-ATTACK-RCE, REQUEST-933-APPLICATION-ATTACK-PHP, REQUEST-941-APPLICATION-ATTACK-XSS, REQUEST-942-APPLICATION-ATTACK-SQLI, REQUEST-943-APPLICATION-ATTACK-SESSION-FIXATION, REQUEST-944-APPLICATION-ATTACK-JAVA, UnknownBots, METHOD-ENFORCEMENT, PROTOCOL-ENFORCEMENT, PROTOCOL-ATTACK, LFI, RFI, RCE, PHP, NODEJS, XSS, SQLI, FIX, JAVA, MS-ThreatIntel-WebShells, MS-ThreatIntel-AppSec, MS-ThreatIntel-SQLI and MS-ThreatIntel-CVEs.\n- rules - (Optional) A list of rules which should be disabled in that group. Disables all rules in the specified group if rules is not specified.\n\n---\nexclusion block supports the following:\n- match_variable - (Required) Match variable of the exclusion rule to exclude header, cookie or GET arguments. Possible values are RequestArgKeys, RequestArgNames, RequestArgValues, RequestCookieKeys, RequestCookieNames, RequestCookieValues, RequestHeaderKeys, RequestHeaderNames and RequestHeaderValues\n- selector - (Optional) String value which will be used for the filter operation. If empty will exclude all traffic on this match_variable\n- selector_match_operator - (Optional) Operator which will be used to search in the variable content. Possible values are Contains, EndsWith, Equals, EqualsAny and StartsWith. If empty will exclude all traffic on this match_variable\n"
  type = object({
    enabled                  = bool
    file_upload_limit_mb     = optional(number)
    firewall_mode            = string
    max_request_body_size_kb = optional(number)
    request_body_check       = optional(bool)
    rule_set_type            = optional(string)
    rule_set_version         = string
    disabled_rule_group = optional(list(object({
      rule_group_name = string
      rules           = optional(list(number))
    })))
    exclusion = optional(list(object({
      match_variable          = string
      selector                = optional(string)
      selector_match_operator = optional(string)
    })))
  })
  default = null
}

variable "zones" {
  description = "(Optional) Specifies a list of Availability Zones in which this Application Gateway should be located. Changing this forces a new Application Gateway to be created."
  type        = set(string)
  default     = ["1", "2", "3"]
}
