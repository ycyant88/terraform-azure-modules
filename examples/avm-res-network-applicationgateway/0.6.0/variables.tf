variable "authentication_certificates" {
  description = "Authentication certificates of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    data       = optional(string)
    name       = optional(string)
    properties = optional(object({}))
  }))
  default = null
}

variable "autoscale_configuration" {
  description = "Application Gateway autoscale configuration.\n"
  type = object({
    max_capacity = optional(number)
    min_capacity = number
  })
  default = null
}

variable "backend_address_pools" {
  description = "Backend address pool of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    backend_addresses = optional(list(object({
      fqdn       = optional(string)
      ip_address = optional(string)
    })))
    name       = optional(string)
    properties = optional(object({}))
  }))
  default = null
}

variable "backend_http_settings_collection" {
  description = "Backend http settings of the application gateway resource. Internal references accept either id or their nested authentication_certificate_key, probe_key, or trusted_root_certificate_key, but not both. A key must be nonblank and case-insensitively match exactly one corresponding component's configured name; it is not a separate alias. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    affinity_cookie_name = optional(string)
    authentication_certificates = optional(list(object({
      id                             = optional(string)
      authentication_certificate_key = optional(string)
    })))
    connection_draining = optional(object({
      drain_timeout_in_sec = number
      enabled              = bool
    }))
    cookie_based_affinity               = optional(string)
    dedicated_backend_connection        = optional(bool)
    host_name                           = optional(string)
    name                                = optional(string)
    path                                = optional(string)
    pick_host_name_from_backend_address = optional(bool)
    port                                = optional(number)
    probe = optional(object({
      id        = optional(string)
      probe_key = optional(string)
    }))
    probe_enabled   = optional(bool)
    properties      = optional(object({}))
    protocol        = optional(string)
    request_timeout = optional(number)
    sni_name        = optional(string)
    trusted_root_certificates = optional(list(object({
      id                           = optional(string)
      trusted_root_certificate_key = optional(string)
    })))
    validate_cert_chain_and_expiry = optional(bool)
    validate_sni                   = optional(bool)
  }))
  default = null
}

variable "backend_settings_collection" {
  description = "Backend settings of the application gateway resource. Internal references accept either id or their nested probe_key or trusted_root_certificate_key, but not both. A key must be nonblank and case-insensitively match exactly one corresponding component's configured name; it is not a separate alias. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    enable_l4_client_ip_preservation    = optional(bool)
    host_name                           = optional(string)
    name                                = optional(string)
    pick_host_name_from_backend_address = optional(bool)
    port                                = optional(number)
    probe = optional(object({
      id        = optional(string)
      probe_key = optional(string)
    }))
    properties = optional(object({}))
    protocol   = optional(string)
    timeout    = optional(number)
    trusted_root_certificates = optional(list(object({
      id                           = optional(string)
      trusted_root_certificate_key = optional(string)
    })))
  }))
  default = null
}

variable "custom_error_configurations" {
  description = "Custom error configurations of the application gateway resource.\n"
  type = list(object({
    custom_error_page_url = optional(string)
    status_code           = optional(string)
  }))
  default = null
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

variable "enable_fips" {
  description = "Whether FIPS is enabled on the application gateway resource.\n"
  type        = bool
  default     = null
}

variable "enable_http2" {
  description = "Whether HTTP2 is enabled on the application gateway resource.\n"
  type        = bool
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "entra_jwt_validation_configs" {
  description = "Entra JWT validation configurations for the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    audiences                    = optional(list(string))
    client_id                    = optional(string)
    name                         = optional(string)
    properties                   = optional(object({}))
    tenant_id                    = optional(string)
    un_authorized_request_action = optional(string)
  }))
  default = null
}

variable "firewall_policy" {
  description = "Reference to another subresource.\n"
  type = object({
    id = optional(string)
  })
  default = null
}

variable "force_firewall_policy_association" {
  description = "If true, associates a firewall policy with an application gateway regardless whether the policy differs from the WAF Config.\n"
  type        = bool
  default     = null
}

variable "frontend_ip_configurations" {
  description = "Frontend IP addresses of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n\nSet public_ip_address_key to a key in public_ip_addresses to attach a module-managed public IP. The module constructs public_ip_address.id. Alternatively, keep supplying an external IP through public_ip_address.id. These options are mutually exclusive. Managed public frontends require a name and cannot include private IP or subnet settings. Private Link configuration is supported alongside a managed public IP.\n\nThe internal private link configuration reference accepts either id or nested private_link_configuration_key, but not both. The key must be nonblank and case-insensitively match exactly one private link configuration's configured name. External public IP and subnet reference objects remain ID-only; use public_ip_address_key separately to select a module-managed public IP by its map key.\n"
  type = list(object({
    name                         = optional(string)
    private_ip_address           = optional(string)
    private_ip_allocation_method = optional(string)
    private_link_configuration = optional(object({
      id                             = optional(string)
      private_link_configuration_key = optional(string)
    }))
    properties            = optional(object({}))
    public_ip_address     = optional(object({ id = optional(string) }))
    public_ip_address_key = optional(string)
    subnet                = optional(object({ id = optional(string) }))
  }))
  default = null
}

variable "frontend_ports" {
  description = "Frontend ports of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name       = optional(string)
    port       = optional(number)
    properties = optional(object({}))
  }))
  default = null
}

variable "gateway_ip_configurations" {
  description = "Subnets of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name       = optional(string)
    properties = optional(object({}))
    subnet     = optional(object({ id = optional(string) }))
  }))
  default = null
}

variable "global_configuration" {
  description = "Application Gateway global configuration.\n"
  type = object({
    enable_request_buffering  = optional(bool)
    enable_response_buffering = optional(bool)
  })
  default = null
}

variable "http_listeners" {
  description = "Http listeners of the application gateway resource. Internal references accept either id or their nested frontend_ip_configuration_key, frontend_port_key, ssl_certificate_key, or ssl_profile_key, but not both. Each key case-insensitively selects the configured name of one corresponding component. Firewall policy remains an external ID-only reference. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    custom_error_configurations = optional(list(object({
      custom_error_page_url = optional(string)
      status_code           = optional(string)
    })))
    firewall_policy = optional(object({ id = optional(string) }))
    frontend_ip_configuration = optional(object({
      id                            = optional(string)
      frontend_ip_configuration_key = optional(string)
    }))
    frontend_port = optional(object({
      id                = optional(string)
      frontend_port_key = optional(string)
    }))
    host_name                      = optional(string)
    host_names                     = optional(list(string))
    name                           = optional(string)
    properties                     = optional(object({}))
    protocol                       = optional(string)
    require_server_name_indication = optional(bool)
    ssl_certificate = optional(object({
      id                  = optional(string)
      ssl_certificate_key = optional(string)
    }))
    ssl_profile = optional(object({
      id              = optional(string)
      ssl_profile_key = optional(string)
    }))
  }))
  default = null
}

variable "ignore_body_changes" {
  description = "Body-relative dot-notation paths to ignore. Ignored configuration is not sent to Azure until the path is removed. Changes take effect only after apply. List indices are not supported.\n\n- network_application_gateways - Paths ignored on the Application Gateway.\n- network_public_ip_addresses - Paths ignored on each module-managed public IP.\n"
  type = object({
    network_application_gateways = optional(list(string), [])
    network_public_ip_addresses  = optional(list(string), [])
  })
  default = {}
}

variable "listeners" {
  description = "Listeners of the application gateway resource. Internal references accept either id or their nested frontend_ip_configuration_key, frontend_port_key, ssl_certificate_key, or ssl_profile_key, but not both. Each key case-insensitively selects the configured name of one corresponding component. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    frontend_ip_configuration = optional(object({
      id                            = optional(string)
      frontend_ip_configuration_key = optional(string)
    }))
    frontend_port = optional(object({
      id                = optional(string)
      frontend_port_key = optional(string)
    }))
    host_names = optional(list(string))
    name       = optional(string)
    properties = optional(object({}))
    protocol   = optional(string)
    ssl_certificate = optional(object({
      id                  = optional(string)
      ssl_certificate_key = optional(string)
    }))
    ssl_profile = optional(object({
      id              = optional(string)
      ssl_profile_key = optional(string)
    }))
  }))
  default = null
}

variable "load_distribution_policies" {
  description = "Load distribution policies of the application gateway resource. Internal backend address pool references accept either id or nested backend_address_pool_key, but not both. The key case-insensitively selects one backend pool's configured name. The id and name on load distribution target definition objects retain their existing definition semantics.\n"
  type = list(object({
    load_distribution_algorithm = optional(string)
    load_distribution_targets = optional(list(object({
      backend_address_pool = optional(object({
        id                       = optional(string)
        backend_address_pool_key = optional(string)
      }))
      id                = optional(string)
      name              = optional(string)
      properties        = optional(object({}))
      weight_per_server = optional(number)
    })))
    name       = optional(string)
    properties = optional(object({}))
  }))
  default = null
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \"CanNotDelete\" and \"ReadOnly\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
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
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "private_endpoints" {
  description = "Private endpoint configuration schema retained for compatibility. **Private endpoint creation is not implemented: entries currently have no deployment effect.** Implementation is tracked in [issue #284](https://github.com/Azure/terraform-azurerm-avm-res-network-applicationgateway/issues/284). The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time. The fields below describe the standard interface, not implemented resource behavior.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n  - name - (Optional) The role assignment name.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n  - notes - (Optional) Notes for the lock.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- subresource_name - (Optional) The private endpoint subresource name.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of this resource.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - The name of the IP configuration.\n  - private_ip_address - The private IP address of the IP configuration.\n  - member_name - (Optional) The private IP configuration member name.\n"
  type = map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      name                                   = optional(string, null)
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
      kind  = string
      name  = optional(string, null)
      notes = optional(string, null)
    }), null)
    tags                                    = optional(map(string), null)
    subnet_resource_id                      = string
    subresource_name                        = optional(string, null)
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
      member_name        = optional(string)
    })), {})
  }))
  default = {}
}

variable "private_endpoints_manage_dns_zone_group" {
  description = "Standard private-endpoint DNS-zone-group control. Currently schema-only: private endpoint creation and DNS-zone-group management are not implemented, so this value has no deployment effect. See https://github.com/Azure/terraform-azurerm-avm-res-network-applicationgateway/issues/284."
  type        = bool
  default     = true
}

variable "private_link_configurations" {
  description = "PrivateLink configurations on application gateway.\n"
  type = list(object({
    ip_configurations = optional(list(object({
      id                           = optional(string)
      name                         = optional(string)
      primary                      = optional(bool)
      private_ip_address           = optional(string)
      private_ip_allocation_method = optional(string)
      properties                   = optional(object({}))
      subnet                       = optional(object({ id = optional(string) }))
    })))
    name       = optional(string)
    properties = optional(object({}))
  }))
  default = null
}

variable "probes" {
  description = "Probes of the application gateway resource.\n"
  type = list(object({
    enable_probe_proxy_protocol_header = optional(bool)
    host                               = optional(string)
    id                                 = optional(string)
    interval                           = optional(number)
    match = optional(object({
      body         = optional(string)
      status_codes = optional(list(string))
    }))
    min_servers                               = optional(number)
    name                                      = optional(string)
    path                                      = optional(string)
    pick_host_name_from_backend_http_settings = optional(bool)
    pick_host_name_from_backend_settings      = optional(bool)
    port                                      = optional(number)
    properties                                = optional(object({}))
    protocol                                  = optional(string)
    timeout                                   = optional(number)
    unhealthy_threshold                       = optional(number)
  }))
  default = null
}

variable "public_ip_addresses" {
  description = "Public IP addresses owned by this module. The default empty map creates no public IPs. Map keys must be known at plan time and are stable Terraform instance keys, independent of Azure names. Reference a key using frontend_ip_configurations[*].public_ip_address_key.\n\nEach entry supports:\n- name - Required Azure public IP name.\n- ip_version - IPv4 (default) or IPv6. At most one managed IP per protocol is supported.\n- parent_id - Existing resource group ID. Defaults to the gateway's parent_id. The IP always uses the gateway's location.\n- zones - Defaults to the gateway's zones. An explicit empty list leaves zone selection to Azure. A non-empty selection must include every gateway zone.\n- tags - Per-IP tags merged over the module's tags.\n- public_ip_prefix_resource_id - Optional existing public IP prefix ID. The prefix must be compatible with the IP's location, protocol and zones.\n- ddos_protection_mode - VirtualNetworkInherited (default), Enabled, or Disabled.\n- ddos_protection_plan_resource_id - Optional existing DDoS plan ID; requires Enabled. Enabled without a plan uses individual IP protection.\n- domain_name_label - Optional Azure-managed DNS label.\n- reverse_fqdn - Optional reverse DNS FQDN; supported for IPv4 only.\n- idle_timeout_in_minutes - Integer from 4 to 30, default 4.\n- ip_tags - IP tag type to tag value mapping, separate from resource tags.\n\nManaged IPs use the Standard SKU, Regional tier and Static allocation. Prefixes, DDoS plans and resource groups are not created. Removing an entry schedules its IP for deletion; transferring ownership requires explicit state migration. See UPGRADE.md.\n"
  type = map(object({
    name                             = string
    ddos_protection_mode             = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_resource_id = optional(string)
    domain_name_label                = optional(string)
    idle_timeout_in_minutes          = optional(number, 4)
    ip_tags                          = optional(map(string), {})
    ip_version                       = optional(string, "IPv4")
    parent_id                        = optional(string)
    public_ip_prefix_resource_id     = optional(string)
    reverse_fqdn                     = optional(string)
    tags                             = optional(map(string), {})
    zones                            = optional(list(string))
  }))
  default = {}
}

variable "redirect_configurations" {
  description = "Redirect configurations of the application gateway resource. Internal references accept either id or their nested http_listener_key, request_routing_rule_key, or url_path_map_key, but not both. A path rule reference uses path_rule_key together with url_path_map_key to identify its parent; neither key can be combined with id. Each key must be nonblank and case-insensitively match the configured name of exactly one corresponding component.\n"
  type = list(object({
    include_path         = optional(bool)
    include_query_string = optional(bool)
    name                 = optional(string)
    path_rules = optional(list(object({
      id               = optional(string)
      path_rule_key    = optional(string)
      url_path_map_key = optional(string)
    })))
    properties    = optional(object({}))
    redirect_type = optional(string)
    request_routing_rules = optional(list(object({
      id                       = optional(string)
      request_routing_rule_key = optional(string)
    })))
    target_listener = optional(object({
      id                = optional(string)
      http_listener_key = optional(string)
    }))
    target_url = optional(string)
    url_path_maps = optional(list(object({
      id               = optional(string)
      url_path_map_key = optional(string)
    })))
  }))
  default = null
}

variable "request_routing_rules" {
  description = "Request routing rules of the application gateway resource. Each internal reference object accepts either id or its type-specific nested *_key, but not both. Keys case-insensitively select the configured name of exactly one corresponding backend pool/settings, JWT configuration, HTTP listener, load distribution policy, redirect configuration, rewrite rule set, or URL path map.\n"
  type = list(object({
    backend_address_pool = optional(object({
      id                       = optional(string)
      backend_address_pool_key = optional(string)
    }))
    backend_http_settings = optional(object({
      id                        = optional(string)
      backend_http_settings_key = optional(string)
    }))
    entra_jwt_validation_config = optional(object({
      id                              = optional(string)
      entra_jwt_validation_config_key = optional(string)
    }))
    http_listener = optional(object({
      id                = optional(string)
      http_listener_key = optional(string)
    }))
    load_distribution_policy = optional(object({
      id                           = optional(string)
      load_distribution_policy_key = optional(string)
    }))
    name       = optional(string)
    priority   = optional(number)
    properties = optional(object({}))
    redirect_configuration = optional(object({
      id                         = optional(string)
      redirect_configuration_key = optional(string)
    }))
    rewrite_rule_set = optional(object({
      id                   = optional(string)
      rewrite_rule_set_key = optional(string)
    }))
    rule_type = optional(string)
    url_path_map = optional(object({
      id               = optional(string)
      url_path_map_key = optional(string)
    }))
  }))
  default = null
}

variable "resource_types" {
  description = "AzAPI resource types and API versions. Override only where the selected API supports the configured properties.\n\n- network_application_gateways - Resource type and API version for the Application Gateway.\n- network_public_ip_addresses - Resource type and API version for module-managed public IPs.\n"
  type = object({
    network_application_gateways = optional(string, "Microsoft.Network/applicationGateways@2025-03-01")
    network_public_ip_addresses  = optional(string, "Microsoft.Network/publicIPAddresses@2025-03-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to the Application Gateway and module-managed public IPs. Defaults to the provider's retry behavior.\n\n- error_message_regex - Error patterns eligible for retry.\n- interval_seconds - Initial retry interval.\n- max_interval_seconds - Maximum retry interval.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "rewrite_rule_sets" {
  description = "Rewrite rules for the application gateway resource.\n"
  type = list(object({
    id         = optional(string)
    name       = optional(string)
    properties = optional(object({}))
    rewrite_rules = optional(list(object({
      action_set = optional(object({
        request_header_configurations = optional(list(object({
          header_name  = optional(string)
          header_value = optional(string)
          header_value_matcher = optional(object({
            ignore_case = optional(bool)
            negate      = optional(bool)
            pattern     = optional(string)
          }))
        })))
        response_header_configurations = optional(list(object({
          header_name  = optional(string)
          header_value = optional(string)
          header_value_matcher = optional(object({
            ignore_case = optional(bool)
            negate      = optional(bool)
            pattern     = optional(string)
          }))
        })))
        url_configuration = optional(object({
          modified_path         = optional(string)
          modified_query_string = optional(string)
          reroute               = optional(bool)
        }))
      }))
      conditions = optional(list(object({
        ignore_case = optional(bool)
        negate      = optional(bool)
        pattern     = optional(string)
        variable    = optional(string)
      })))
      name          = optional(string)
      rule_sequence = optional(number)
    })))
  }))
  default = null
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n- delegated_managed_identity_resource_id - The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created.\n- principal_type - The type of the principal_id. Possible values are User, Group and ServicePrincipal. Changing this forces a new resource to be created. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "routing_rules" {
  description = "Routing rules of the application gateway resource. Internal references accept either id or their nested backend_address_pool_key, backend_settings_key, or listener_key, but not both. Each key case-insensitively selects the configured name of one corresponding component.\n"
  type = list(object({
    backend_address_pool = optional(object({
      id                       = optional(string)
      backend_address_pool_key = optional(string)
    }))
    backend_settings = optional(object({
      id                   = optional(string)
      backend_settings_key = optional(string)
    }))
    listener = optional(object({
      id           = optional(string)
      listener_key = optional(string)
    }))
    name       = optional(string)
    priority   = optional(number)
    properties = optional(object({}))
    rule_type  = optional(string)
  }))
  default = null
}

variable "sku" {
  description = "SKU of an application gateway.\n"
  type = object({
    capacity = optional(number)
    family   = optional(string)
    name     = optional(string)
    tier     = optional(string)
  })
  default = null
}

variable "ssl_certificates" {
  description = "SSL certificates of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    data                = optional(string)
    key_vault_secret_id = optional(string)
    name                = optional(string)
    password            = optional(string)
    properties          = optional(object({}))
  }))
  default = null
}

variable "ssl_policy" {
  description = "Application Gateway Ssl policy.\n"
  type = object({
    cipher_suites          = optional(list(string))
    disabled_ssl_protocols = optional(list(string))
    min_protocol_version   = optional(string)
    policy_name            = optional(string)
    policy_type            = optional(string)
  })
  default = null
}

variable "ssl_profiles" {
  description = "SSL profiles of the application gateway resource. Internal trusted client certificate references accept either id or nested trusted_client_certificate_key, but not both. Each key case-insensitively selects the configured name of one trusted client certificate. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    client_auth_configuration = optional(object({
      verify_client_auth_mode      = optional(string)
      verify_client_cert_issuer_dn = optional(bool)
      verify_client_revocation     = optional(string)
    }))
    name       = optional(string)
    properties = optional(object({}))
    ssl_policy = optional(object({
      cipher_suites          = optional(list(string))
      disabled_ssl_protocols = optional(list(string))
      min_protocol_version   = optional(string)
      policy_name            = optional(string)
      policy_type            = optional(string)
    }))
    trusted_client_certificates = optional(list(object({
      id                             = optional(string)
      trusted_client_certificate_key = optional(string)
    })))
  }))
  default = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to the Application Gateway and module-managed public IPs. Omitted values use provider defaults.\n\n- create - Creation timeout, as a Go duration such as 1h.\n- read - Read timeout.\n- update - Update timeout.\n- delete - Deletion timeout.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "trusted_client_certificates" {
  description = "Trusted client certificates of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    data       = optional(string)
    name       = optional(string)
    properties = optional(object({}))
  }))
  default = null
}

variable "trusted_root_certificates" {
  description = "Trusted Root certificates of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    data                = optional(string)
    key_vault_secret_id = optional(string)
    name                = optional(string)
    properties          = optional(object({}))
  }))
  default = null
}

variable "url_path_maps" {
  description = "URL path map of the application gateway resource. Internal default and path-rule references accept either id or their nested backend_address_pool_key, backend_http_settings_key, load_distribution_policy_key, redirect_configuration_key, or rewrite_rule_set_key, but not both. Each key case-insensitively selects the configured name of one corresponding component. Path rule definition id and name fields retain their existing definition semantics, and firewall policy remains an external ID-only reference.\n"
  type = list(object({
    default_backend_address_pool = optional(object({
      id                       = optional(string)
      backend_address_pool_key = optional(string)
    }))
    default_backend_http_settings = optional(object({
      id                        = optional(string)
      backend_http_settings_key = optional(string)
    }))
    default_load_distribution_policy = optional(object({
      id                           = optional(string)
      load_distribution_policy_key = optional(string)
    }))
    default_redirect_configuration = optional(object({
      id                         = optional(string)
      redirect_configuration_key = optional(string)
    }))
    default_rewrite_rule_set = optional(object({
      id                   = optional(string)
      rewrite_rule_set_key = optional(string)
    }))
    name = optional(string)
    path_rules = optional(list(object({
      backend_address_pool = optional(object({
        id                       = optional(string)
        backend_address_pool_key = optional(string)
      }))
      backend_http_settings = optional(object({
        id                        = optional(string)
        backend_http_settings_key = optional(string)
      }))
      firewall_policy = optional(object({ id = optional(string) }))
      id              = optional(string)
      load_distribution_policy = optional(object({
        id                           = optional(string)
        load_distribution_policy_key = optional(string)
      }))
      name       = optional(string)
      paths      = optional(list(string))
      properties = optional(object({}))
      redirect_configuration = optional(object({
        id                         = optional(string)
        redirect_configuration_key = optional(string)
      }))
      rewrite_rule_set = optional(object({
        id                   = optional(string)
        rewrite_rule_set_key = optional(string)
      }))
    })))
    properties = optional(object({}))
  }))
  default = null
}

variable "web_application_firewall_configuration" {
  description = "Application gateway web application firewall configuration.\n"
  type = object({
    disabled_rule_groups = optional(list(object({
      rule_group_name = string
      rules           = optional(list(number))
    })))
    enabled = bool
    exclusions = optional(list(object({
      match_variable          = string
      selector                = string
      selector_match_operator = string
    })))
    file_upload_limit_in_mb     = optional(number)
    firewall_mode               = string
    max_request_body_size       = optional(number)
    max_request_body_size_in_kb = optional(number)
    request_body_check          = optional(bool)
    rule_set_type               = string
    rule_set_version            = string
  })
  default = null
}

variable "zones" {
  description = "A list of availability zones denoting where the resource needs to come from.\n"
  type        = list(string)
  default     = null
}
