variable "app_settings" {
  description = "App settings for the slot."
  type        = map(string)
  default     = {}
}

variable "application_insights_connection_string" {
  description = "The Application Insights connection string (pre-computed from the parent module)."
  type        = string
  default     = null
}

variable "application_insights_key" {
  description = "The Application Insights instrumentation key (pre-computed from the parent module)."
  type        = string
  default     = null
}

variable "auto_generated_domain_name_label_scope" {
  description = "The scope of the auto-generated domain name label."
  type        = string
  default     = null
}

variable "client_affinity_enabled" {
  description = "Should client affinity be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "client_affinity_partitioning_enabled" {
  description = "Should client affinity partitioning (CHIPS) be enabled?"
  type        = bool
  default     = null
}

variable "client_affinity_proxy_enabled" {
  description = "Should client affinity proxy be enabled?"
  type        = bool
  default     = null
}

variable "client_certificate_enabled" {
  description = "Should client certificates be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "client_certificate_exclusion_paths" {
  description = "Paths to exclude from client certificate authentication."
  type        = string
  default     = null
}

variable "client_certificate_mode" {
  description = "The client certificate mode. Defaults to Required."
  type        = string
  default     = "Required"
}

variable "connection_strings" {
  description = "Connection strings for the slot."
  type = map(object({
    name  = optional(string)
    type  = optional(string)
    value = optional(string)
  }))
  default = {}
}

variable "container_size" {
  description = "The size of the function container in MB."
  type        = number
  default     = null
}

variable "dapr_config" {
  description = "Dapr configuration for the slot."
  type = object({
    app_id                = optional(string)
    app_port              = optional(number)
    enable_api_logging    = optional(bool)
    enabled               = optional(bool)
    http_max_request_size = optional(number)
    http_read_buffer_size = optional(number)
    log_level             = optional(string)
  })
  default = null
}

variable "delete_empty_service_plan" {
  description = "Should the App Service Plan be deleted when this slot is deleted and it was the last app on that plan? Defaults to true, which matches the Azure REST API default.\n\nThis maps to the deleteEmptyServerFarm query parameter on the Microsoft.Web/sites/slots delete operation. See <https://learn.microsoft.com/rest/api/appservice/web-apps/delete-slot>.\n"
  type        = bool
  default     = true
}

variable "dns_configuration" {
  description = "DNS configuration for the slot."
  type = object({
    alternate_private_dns_zone_id = optional(string)
    dns_legacy_sort_order         = optional(bool)
    dns_suffix                    = optional(string)
  })
  default = null
}

variable "enabled" {
  description = "Is the slot enabled? Defaults to true."
  type        = bool
  default     = true
}

variable "end_to_end_encryption_enabled" {
  description = "Should end-to-end encryption be enabled?"
  type        = bool
  default     = null
}

variable "ftp_publish_basic_authentication_enabled" {
  description = "Should FTP basic authentication be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "function_app_uses_fc1" {
  description = "Whether the parent app uses Flex Consumption (FC1) plan."
  type        = bool
  default     = false
}

variable "host_names_disabled" {
  description = "Should public hostnames be disabled?"
  type        = bool
  default     = null
}

variable "hosting_environment_id" {
  description = "The resource ID of the App Service Environment."
  type        = string
  default     = null
}

variable "https_only" {
  description = "Should the slot only be accessible over HTTPS? Defaults to true."
  type        = bool
  default     = true
}

variable "hyper_v" {
  description = "Should the slot run in Hyper-V isolation?"
  type        = bool
  default     = null
}

variable "ignore_body_changes" {
  description = "Body-relative paths whose changes are ignored, keyed by AzAPI resource type for resources this module declares, and by submodule name for resources its submodules declare. Paths use dot notation, and a change takes effect only after an apply.\n\nThe AzAPI provider exposes ignore_body_changes on azapi_resource only, so the fields belonging to submodules that manage their resource through azapi_update_resource or azapi_resource_action exist for interface consistency. Setting a non-empty value on one of those fails the plan with an explicit error rather than being silently ignored.\n\n- authorization_locks - Paths ignored on the management locks.\n- authorization_role_assignments - Paths ignored on the role assignments.\n- network_private_endpoints - Paths ignored on the private endpoints.\n- network_private_endpoints_private_dns_zone_groups - Paths ignored on the private DNS zone groups.\n- web_sites_slots - Paths ignored on the slot.\n- config_appsettings - Paths passed to the app settings submodule.\n- config_azurestorageaccounts - Paths passed to the storage account mounts submodule.\n- config_connectionstrings - Paths passed to the connection strings submodule.\n- config_metadata - Paths passed to the site metadata submodule.\n- extensions_zipdeploy - Paths passed to the zip deployment submodule.\n- publishing_credential_policy - Paths passed to the publishing credential policy submodules.\n"
  type = object({
    authorization_locks                               = optional(list(string), [])
    authorization_role_assignments                    = optional(list(string), [])
    network_private_endpoints                         = optional(list(string), [])
    network_private_endpoints_private_dns_zone_groups = optional(list(string), [])
    web_sites_slots                                   = optional(list(string), [])

    config_appsettings = optional(object({
      web_sites_config       = optional(list(string), [])
      web_sites_slots_config = optional(list(string), [])
    }), {})
    config_azurestorageaccounts = optional(object({
      web_sites       = optional(list(string), [])
      web_sites_slots = optional(list(string), [])
    }), {})
    config_connectionstrings = optional(object({
      web_sites_config       = optional(list(string), [])
      web_sites_slots_config = optional(list(string), [])
    }), {})
    config_metadata = optional(object({
      web_sites_config       = optional(list(string), [])
      web_sites_slots_config = optional(list(string), [])
    }), {})
    extensions_zipdeploy = optional(object({
      web_sites       = optional(list(string), [])
      web_sites_slots = optional(list(string), [])
    }), {})
    publishing_credential_policy = optional(object({
      web_sites_basic_publishing_credentials_policies       = optional(list(string), [])
      web_sites_slots_basic_publishing_credentials_policies = optional(list(string), [])
    }), {})
  })
  default = {}
}

variable "ip_mode" {
  description = "The IP mode. Possible values: IPv4, IPv4AndIPv6, IPv6."
  type        = string
  default     = null
}

variable "is_function_app" {
  description = "Whether the parent app is a function app."
  type        = bool
  default     = false
}

variable "key_vault_reference_identity" {
  description = "The identity to use for Key Vault references."
  type        = string
  default     = null
}

variable "kind" {
  description = "The ARM kind of the app (e.g. app, app,linux, functionapp, functionapp,linux)."
  type        = string
  default     = ""
}

variable "location" {
  description = "The Azure region for the slot."
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock to apply to the slot."
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_environment_id" {
  description = "The Azure Container Apps managed environment ID."
  type        = string
  default     = null
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
  description = "The name of the deployment slot."
  type        = string
  default     = ""
}

variable "os_type" {
  description = "The OS type of the app. Must be Linux or Windows."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The resource ID of the App Service site."
  type        = string
  default     = ""
}

variable "private_endpoints" {
  description = "Private endpoints for the slot."
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
      member_name        = optional(string, null)
    })), {})
  }))
  default = {}
}

variable "private_endpoints_inherit_lock" {
  description = "Whether private endpoints should inherit the lock from the slot."
  type        = bool
  default     = false
}

variable "private_endpoints_manage_dns_zone_group" {
  description = "Whether to manage DNS zone groups for private endpoints."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Should public network access be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "redundancy_mode" {
  description = "The site redundancy mode."
  type        = string
  default     = null
}

variable "resource_config" {
  description = "Resource config for Container App environment hosted apps."
  type = object({
    cpu    = optional(number)
    memory = optional(string)
  })
  default = null
}

variable "resource_types" {
  description = "AzAPI resource types and API versions, keyed by resource type for resources this module declares, and by submodule name for resources its submodules declare. Each submodule owns the defaults for its own resources.\n\n- authorization_locks - Resource type and API version for the management locks.\n- authorization_role_assignments - Resource type and API version for the role assignments.\n- network_private_endpoints - Resource type and API version for the private endpoints.\n- network_private_endpoints_private_dns_zone_groups - Resource type and API version for the private DNS zone groups.\n- web_sites_slots - Resource type and API version for the slot.\n- config_appsettings - Resource-type overrides passed to the app settings submodule.\n- config_azurestorageaccounts - Resource-type overrides passed to the storage account mounts submodule.\n- config_connectionstrings - Resource-type overrides passed to the connection strings submodule.\n- config_metadata - Resource-type overrides passed to the site metadata submodule.\n- extensions_zipdeploy - Resource-type overrides passed to the zip deployment submodule.\n- publishing_credential_policy - Resource-type overrides passed to the publishing credential policy submodules.\n"
  type = object({
    authorization_locks                               = optional(string, "Microsoft.Authorization/locks@2020-05-01")
    authorization_role_assignments                    = optional(string, "Microsoft.Authorization/roleAssignments@2022-04-01")
    network_private_endpoints                         = optional(string, "Microsoft.Network/privateEndpoints@2024-05-01")
    network_private_endpoints_private_dns_zone_groups = optional(string, "Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2024-05-01")
    web_sites_slots                                   = optional(string, "Microsoft.Web/sites/slots@2025-03-01")

    config_appsettings = optional(object({
      web_sites_config       = optional(string)
      web_sites_slots_config = optional(string)
    }), {})
    config_azurestorageaccounts = optional(object({
      web_sites       = optional(string)
      web_sites_slots = optional(string)
    }), {})
    config_connectionstrings = optional(object({
      web_sites_config       = optional(string)
      web_sites_slots_config = optional(string)
    }), {})
    config_metadata = optional(object({
      web_sites_config       = optional(string)
      web_sites_slots_config = optional(string)
    }), {})
    extensions_zipdeploy = optional(object({
      web_sites       = optional(string)
      web_sites_slots = optional(string)
    }), {})
    publishing_credential_policy = optional(object({
      web_sites_basic_publishing_credentials_policies       = optional(string)
      web_sites_slots_basic_publishing_credentials_policies = optional(string)
    }), {})
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration for the AzAPI resources declared by this module and its submodules. Defaults to retrying the conflict Azure returns while another operation on the site is in progress.\n\n- error_message_regex - (Optional) A list of regular expressions matched against error messages. A match triggers a retry.\n- interval_seconds - (Optional) The initial interval in seconds between retries.\n- max_interval_seconds - (Optional) The maximum interval in seconds between retries.\n"
  type = object({
    error_message_regex  = optional(list(string), ["Cannot modify this site because another operation is in progress"])
    interval_seconds     = optional(number, 10)
    max_interval_seconds = optional(number)
  })
  default = {}
}

variable "role_assignments" {
  description = "Role assignments for the slot."
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

variable "scm_site_also_stopped" {
  description = "Should the SCM site also be stopped?"
  type        = bool
  default     = null
}

variable "sensitive_app_settings" {
  description = "Sensitive app settings to merge (e.g. from the parent module's slot_sensitive_app_settings variable)."
  type        = map(string)
  default     = {}
}

variable "server_farm_id" {
  description = "Optional override server farm resource ID for this slot."
  type        = string
  default     = null
}

variable "service_plan_resource_id" {
  description = "The default App Service Plan resource ID (used if server_farm_id is not set)."
  type        = string
  default     = ""
}

variable "site_config" {
  description = "Site configuration for the deployment slot."
  type = object({
    always_on             = optional(bool, true)
    api_definition_url    = optional(string)
    api_management_api_id = optional(string)
    app_command_line      = optional(string)
    app_scale_limit       = optional(number)
    auto_heal_enabled     = optional(bool)
    auto_heal_rules = optional(object({
      actions = optional(object({
        action_type = string
        custom_action = optional(object({
          exe        = string
          parameters = optional(string)
        }))
        min_process_execution_time = optional(string, "00:00:00")
      }))
      triggers = optional(object({
        private_bytes_in_kb = optional(number)
        requests = optional(object({
          count         = number
          time_interval = string
        }))
        slow_requests = optional(object({
          count         = number
          time_interval = string
          time_taken    = string
          path          = optional(string)
        }))
        slow_requests_with_path = optional(list(object({
          count         = number
          time_interval = string
          time_taken    = string
          path          = optional(string)
        })), [])
        status_codes = optional(list(object({
          count         = number
          time_interval = string
          status        = number
          path          = optional(string)
          sub_status    = optional(number)
          win32_status  = optional(number)
        })), [])
        status_codes_range = optional(list(object({
          count         = number
          time_interval = string
          status_codes  = string
          path          = optional(string)
        })), [])
      }))
    }))
    auto_swap_slot_name                           = optional(string)
    container_registry_managed_identity_client_id = optional(string)
    container_registry_use_managed_identity       = optional(bool)
    cors = optional(object({
      allowed_origins     = optional(list(string))
      support_credentials = optional(bool, false)
    }))
    default_documents              = optional(list(string))
    detailed_error_logging_enabled = optional(bool)
    document_root                  = optional(string)
    dotnet_framework_version       = optional(string)
    elastic_instance_minimum       = optional(number)
    elastic_web_app_scale_limit    = optional(number)
    experiments = optional(object({
      ramp_up_rules = optional(list(object({
        action_host_name             = optional(string)
        change_decision_callback_url = optional(string)
        change_interval_in_minutes   = optional(number)
        change_step                  = optional(number)
        max_reroute_percentage       = optional(number)
        min_reroute_percentage       = optional(number)
        name                         = optional(string)
        reroute_percentage           = optional(number)
      })), [])
    }))
    ftps_state = optional(string, "FtpsOnly")
    handler_mappings = optional(list(object({
      arguments        = optional(string)
      extension        = optional(string)
      script_processor = optional(string)
    })))
    health_check_path    = optional(string)
    http2_enabled        = optional(bool, false)
    http20_proxy_flag    = optional(number)
    http_logging_enabled = optional(bool)
    ip_restriction = optional(list(object({
      action                    = optional(string, "Allow")
      ip_address                = optional(string)
      name                      = optional(string)
      priority                  = optional(number, 65000)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      headers = optional(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(list(string))
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      }))
    })), [])
    ip_restriction_default_action = optional(string, "Allow")
    java_container                = optional(string)
    java_container_version        = optional(string)
    java_version                  = optional(string)
    limits = optional(object({
      max_disk_size_in_mb = optional(number)
      max_memory_in_mb    = optional(number)
      max_percentage_cpu  = optional(number)
    }))
    linux_fx_version          = optional(string)
    load_balancing_mode       = optional(string, "LeastRequests")
    local_mysql_enabled       = optional(bool, false)
    logs_directory_size_limit = optional(number)
    managed_pipeline_mode     = optional(string, "Integrated")
    metadata = optional(list(object({
      name  = string
      value = string
    })))
    min_tls_cipher_suite             = optional(string)
    minimum_tls_version              = optional(string, "1.3")
    node_version                     = optional(string)
    php_version                      = optional(string)
    powershell_version               = optional(string)
    pre_warmed_instance_count        = optional(number)
    python_version                   = optional(string)
    remote_debugging_enabled         = optional(bool, false)
    remote_debugging_version         = optional(string)
    request_tracing_enabled          = optional(bool)
    request_tracing_expiration_time  = optional(string)
    runtime_scale_monitoring_enabled = optional(bool)
    scm_ip_restriction = optional(list(object({
      action                    = optional(string, "Allow")
      ip_address                = optional(string)
      name                      = optional(string)
      priority                  = optional(number, 65000)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      headers = optional(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(list(string))
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      }))
    })), [])
    scm_ip_restriction_default_action      = optional(string, "Allow")
    scm_minimum_tls_version                = optional(string, "1.2")
    scm_type                               = optional(string, "None")
    scm_use_main_ip_restriction            = optional(bool, false)
    tracing_options                        = optional(string)
    use_32_bit_worker                      = optional(bool, false)
    vnet_private_ports_count               = optional(number)
    vnet_route_all_enabled                 = optional(bool, false)
    website_time_zone                      = optional(string)
    websockets_enabled                     = optional(bool, false)
    windows_fx_version                     = optional(string)
    worker_count                           = optional(number)
    application_insights_connection_string = optional(string)
    application_insights_key               = optional(string)
    application_stack = optional(object({
      docker = optional(object({
        docker_image_name   = optional(string)
        docker_registry_url = optional(string)
        docker_image_tag    = optional(string, "latest")
      }))
      dotnet = optional(object({
        dotnet_version              = optional(string)
        current_stack               = optional(string)
        use_custom_runtime          = optional(bool, false)
        use_dotnet_isolated_runtime = optional(bool, false)
      }))
      java = optional(object({
        java_version           = optional(string)
        java_container         = optional(string)
        java_container_version = optional(string)
      }))
      node = optional(object({
        node_version = optional(string)
      }))
      php = optional(object({
        php_version = optional(string)
      }))
      python = optional(object({
        python_version = optional(string)
      }))
      powershell = optional(object({
        powershell_version = optional(string)
      }))
    }))
    virtual_application = optional(list(object({
      physical_path   = optional(string, "site\\wwwroot")
      preload_enabled = optional(bool, false)
      virtual_path    = optional(string, "/")
      virtual_directory = optional(list(object({
        physical_path = optional(string)
        virtual_path  = optional(string)
      })), [])
    })), [])
  })
  default = {}
}

variable "ssh_enabled" {
  description = "Should SSH be enabled?"
  type        = bool
  default     = null
}

variable "storage_account_required" {
  description = "Should a storage account be required?"
  type        = bool
  default     = null
}

variable "storage_shares_access_keys" {
  description = "A map of access keys for storage shares to mount, keyed by the storage share mount key (sensitive)."
  type        = map(string)
  default     = {}
}

variable "storage_shares_to_mount" {
  description = "Storage shares to mount on the slot."
  type = map(object({
    account_name = string
    mount_path   = string
    name         = string
    share_name   = string
    type         = optional(string, "AzureFiles")
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to the slot."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to the AzAPI resources declared by this module and its submodules. Defaults to null, which uses the provider defaults. Each value is a Go duration string such as 30m.\n\n- create - (Optional) Timeout for create operations.\n- delete - (Optional) Timeout for delete operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "virtual_network_subnet_id" {
  description = "The subnet ID for VNet integration."
  type        = string
  default     = null
}

variable "vnet_application_traffic_enabled" {
  description = "Should application traffic use VNet routing? Defaults to false."
  type        = bool
  default     = false
}

variable "vnet_backup_restore_enabled" {
  description = "Should backup/restore traffic use VNet routing? Defaults to false."
  type        = bool
  default     = false
}

variable "vnet_content_share_enabled" {
  description = "Should content share traffic use VNet routing? Defaults to false."
  type        = bool
  default     = false
}

variable "vnet_image_pull_enabled" {
  description = "Should image pull traffic use VNet routing? Defaults to false."
  type        = bool
  default     = false
}

variable "vnet_route_all_traffic" {
  description = "Should all outbound traffic use VNet routing? Defaults to false."
  type        = bool
  default     = false
}

variable "webdeploy_publish_basic_authentication_enabled" {
  description = "Should WebDeploy basic authentication be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "workload_profile_name" {
  description = "The workload profile name."
  type        = string
  default     = null
}

variable "zip_deploy_file" {
  description = "The path to the zip file to deploy to the slot."
  type        = string
  default     = null
}

variable "zip_deploy_wait_duration" {
  description = "The duration to wait after applying app settings and connection strings before triggering zip deploy."
  type        = string
  default     = "60s"
}
