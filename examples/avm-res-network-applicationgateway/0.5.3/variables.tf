variable "authentication_certificates" {
  description = "Authentication certificates of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      data = optional(string)
    }))
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
    name = optional(string)
    properties = optional(object({
      backend_addresses = optional(list(object({
        fqdn       = optional(string)
        ip_address = optional(string)
      })))
    }))
  }))
  default = null
}

variable "backend_http_settings_collection" {
  description = "Backend http settings of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      affinity_cookie_name = optional(string)
      authentication_certificates = optional(list(object({
        id = optional(string)
      })))
      connection_draining = optional(object({
        drain_timeout_in_sec = number
        enabled              = bool
      }))
      cookie_based_affinity               = optional(string)
      dedicated_backend_connection        = optional(bool)
      host_name                           = optional(string)
      path                                = optional(string)
      pick_host_name_from_backend_address = optional(bool)
      port                                = optional(number)
      probe = optional(object({
        id = optional(string)
      }))
      probe_enabled   = optional(bool)
      protocol        = optional(string)
      request_timeout = optional(number)
      sni_name        = optional(string)
      trusted_root_certificates = optional(list(object({
        id = optional(string)
      })))
      validate_cert_chain_and_expiry = optional(bool)
      validate_sni                   = optional(bool)
    }))
  }))
  default = null
}

variable "backend_settings_collection" {
  description = "Backend settings of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      enable_l4_client_ip_preservation    = optional(bool)
      host_name                           = optional(string)
      pick_host_name_from_backend_address = optional(bool)
      port                                = optional(number)
      probe = optional(object({
        id = optional(string)
      }))
      protocol = optional(string)
      timeout  = optional(number)
      trusted_root_certificates = optional(list(object({
        id = optional(string)
      })))
    }))
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
    name = optional(string)
    properties = optional(object({
      audiences                    = optional(list(string))
      client_id                    = optional(string)
      tenant_id                    = optional(string)
      un_authorized_request_action = optional(string)
    }))
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
  description = "Frontend IP addresses of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      private_ip_address           = optional(string)
      private_ip_allocation_method = optional(string)
      private_link_configuration = optional(object({
        id = optional(string)
      }))
      public_ip_address = optional(object({
        id = optional(string)
      }))
      subnet = optional(object({
        id = optional(string)
      }))
    }))
  }))
  default = null
}

variable "frontend_ports" {
  description = "Frontend ports of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      port = optional(number)
    }))
  }))
  default = null
}

variable "gateway_ip_configurations" {
  description = "Subnets of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      subnet = optional(object({
        id = optional(string)
      }))
    }))
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
  description = "Http listeners of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      custom_error_configurations = optional(list(object({
        custom_error_page_url = optional(string)
        status_code           = optional(string)
      })))
      firewall_policy = optional(object({
        id = optional(string)
      }))
      frontend_ip_configuration = optional(object({
        id = optional(string)
      }))
      frontend_port = optional(object({
        id = optional(string)
      }))
      host_name                      = optional(string)
      host_names                     = optional(list(string))
      protocol                       = optional(string)
      require_server_name_indication = optional(bool)
      ssl_certificate = optional(object({
        id = optional(string)
      }))
      ssl_profile = optional(object({
        id = optional(string)
      }))
    }))
  }))
  default = null
}

variable "listeners" {
  description = "Listeners of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      frontend_ip_configuration = optional(object({
        id = optional(string)
      }))
      frontend_port = optional(object({
        id = optional(string)
      }))
      host_names = optional(list(string))
      protocol   = optional(string)
      ssl_certificate = optional(object({
        id = optional(string)
      }))
      ssl_profile = optional(object({
        id = optional(string)
      }))
    }))
  }))
  default = null
}

variable "load_distribution_policies" {
  description = "Load distribution policies of the application gateway resource.\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      load_distribution_algorithm = optional(string)
      load_distribution_targets = optional(list(object({
        id   = optional(string)
        name = optional(string)
        properties = optional(object({
          backend_address_pool = optional(object({
            id = optional(string)
          }))
          weight_per_server = optional(number)
        }))
      })))
    }))
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

variable "private_link_configurations" {
  description = "PrivateLink configurations on application gateway.\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      ip_configurations = optional(list(object({
        id   = optional(string)
        name = optional(string)
        properties = optional(object({
          primary                      = optional(bool)
          private_ip_address           = optional(string)
          private_ip_allocation_method = optional(string)
          subnet = optional(object({
            id = optional(string)
          }))
        }))
      })))
    }))
  }))
  default = null
}

variable "probes" {
  description = "Probes of the application gateway resource.\n"
  type = list(object({
    id   = optional(string)
    name = optional(string)
    properties = optional(object({
      enable_probe_proxy_protocol_header = optional(bool)
      host                               = optional(string)
      interval                           = optional(number)
      match = optional(object({
        body         = optional(string)
        status_codes = optional(list(string))
      }))
      min_servers                               = optional(number)
      path                                      = optional(string)
      pick_host_name_from_backend_http_settings = optional(bool)
      pick_host_name_from_backend_settings      = optional(bool)
      port                                      = optional(number)
      protocol                                  = optional(string)
      timeout                                   = optional(number)
      unhealthy_threshold                       = optional(number)
    }))
  }))
  default = null
}

variable "redirect_configurations" {
  description = "Redirect configurations of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      include_path         = optional(bool)
      include_query_string = optional(bool)
      path_rules = optional(list(object({
        id = optional(string)
      })))
      redirect_type = optional(string)
      request_routing_rules = optional(list(object({
        id = optional(string)
      })))
      target_listener = optional(object({
        id = optional(string)
      }))
      target_url = optional(string)
      url_path_maps = optional(list(object({
        id = optional(string)
      })))
    }))
  }))
  default = null
}

variable "request_routing_rules" {
  description = "Request routing rules of the application gateway resource.\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      backend_address_pool = optional(object({
        id = optional(string)
      }))
      backend_http_settings = optional(object({
        id = optional(string)
      }))
      entra_jwt_validation_config = optional(object({
        id = optional(string)
      }))
      http_listener = optional(object({
        id = optional(string)
      }))
      load_distribution_policy = optional(object({
        id = optional(string)
      }))
      priority = optional(number)
      redirect_configuration = optional(object({
        id = optional(string)
      }))
      rewrite_rule_set = optional(object({
        id = optional(string)
      }))
      rule_type = optional(string)
      url_path_map = optional(object({
        id = optional(string)
      }))
    }))
  }))
  default = null
}

variable "rewrite_rule_sets" {
  description = "Rewrite rules for the application gateway resource.\n"
  type = list(object({
    id   = optional(string)
    name = optional(string)
    properties = optional(object({
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
  description = "Routing rules of the application gateway resource.\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      backend_address_pool = optional(object({
        id = optional(string)
      }))
      backend_settings = optional(object({
        id = optional(string)
      }))
      listener = optional(object({
        id = optional(string)
      }))
      priority  = number
      rule_type = optional(string)
    }))
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
    name = optional(string)
    properties = optional(object({
      data                = optional(string)
      key_vault_secret_id = optional(string)
      password            = optional(string)
    }))
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
  description = "SSL profiles of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      client_auth_configuration = optional(object({
        verify_client_auth_mode      = optional(string)
        verify_client_cert_issuer_dn = optional(bool)
        verify_client_revocation     = optional(string)
      }))
      ssl_policy = optional(object({
        cipher_suites          = optional(list(string))
        disabled_ssl_protocols = optional(list(string))
        min_protocol_version   = optional(string)
        policy_name            = optional(string)
        policy_type            = optional(string)
      }))
      trusted_client_certificates = optional(list(object({
        id = optional(string)
      })))
    }))
  }))
  default = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "trusted_client_certificates" {
  description = "Trusted client certificates of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      data = optional(string)
    }))
  }))
  default = null
}

variable "trusted_root_certificates" {
  description = "Trusted Root certificates of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      data                = optional(string)
      key_vault_secret_id = optional(string)
    }))
  }))
  default = null
}

variable "url_path_maps" {
  description = "URL path map of the application gateway resource. For default limits, see [Application Gateway limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).\n"
  type = list(object({
    name = optional(string)
    properties = optional(object({
      default_backend_address_pool = optional(object({
        id = optional(string)
      }))
      default_backend_http_settings = optional(object({
        id = optional(string)
      }))
      default_load_distribution_policy = optional(object({
        id = optional(string)
      }))
      default_redirect_configuration = optional(object({
        id = optional(string)
      }))
      default_rewrite_rule_set = optional(object({
        id = optional(string)
      }))
      path_rules = optional(list(object({
        id   = optional(string)
        name = optional(string)
        properties = optional(object({
          backend_address_pool = optional(object({
            id = optional(string)
          }))
          backend_http_settings = optional(object({
            id = optional(string)
          }))
          firewall_policy = optional(object({
            id = optional(string)
          }))
          load_distribution_policy = optional(object({
            id = optional(string)
          }))
          paths = optional(list(string))
          redirect_configuration = optional(object({
            id = optional(string)
          }))
          rewrite_rule_set = optional(object({
            id = optional(string)
          }))
        }))
      })))
    }))
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
