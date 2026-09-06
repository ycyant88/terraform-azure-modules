variable "all_child_resources_inherit_tags" {
  description = "Should child resources inherit tags from the parent resource? Defaults to true."
  type        = bool
  default     = true
}

variable "always_ready" {
  description = "A map of always-ready instances for Flex Consumption Function Apps.\n- name: The trigger type or function name. Valid values: http, blob, durable, function:<target-function-app-name>.\n- instance_count: The number of always-ready instances. Defaults to 0.\n"
  type = map(object({
    name           = optional(string)
    instance_count = optional(number, 0)
  }))
  default = {}
}

variable "app_service_active_slot" {
  description = "Object that sets the active slot for the App Service.\n\n- slot_key - The key of the slot object to set as active.\n- overwrite_network_config - Determines if the network configuration should be overwritten. Defaults to true.\n"
  type = object({
    slot_key                 = optional(string)
    overwrite_network_config = optional(bool, true)
  })
  default = null
}

variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values to assign to the App Service.\nThese are set via the Microsoft.Web/sites/config (name: appsettings) sub-resource.\n"
  type        = map(string)
  default     = {}
}

variable "application_insights_connection_string" {
  description = "The Application Insights connection string. Provide this from an externally managed Application Insights resource."
  type        = string
  default     = null
}

variable "application_insights_key" {
  description = "The Application Insights instrumentation key. Provide this from an externally managed Application Insights resource."
  type        = string
  default     = null
}

variable "auth_settings" {
  description = "A map of authentication settings to assign to the App Service.\n\n- additional_login_parameters - (Optional) A map of additional login parameters.\n- allowed_external_redirect_urls - (Optional) A list of allowed external redirect URLs.\n- default_provider - (Optional) The default authentication provider.\n- enabled - (Optional) Is authentication enabled? Defaults to false.\n- issuer - (Optional) The issuer URI.\n- runtime_version - (Optional) The runtime version of the authentication module.\n- token_refresh_extension_hours - (Optional) Hours before token expiry to refresh. Defaults to 72.\n- token_store_enabled - (Optional) Should the token store be enabled? Defaults to false.\n- unauthenticated_client_action - (Optional) The action to take for unauthenticated requests.\n- active_directory - (Optional) An Active Directory authentication block.\n  - client_id - (Optional) The Client ID of the Azure AD application.\n  - allowed_audiences - (Optional) A list of allowed audience values.\n  - client_secret - (Optional) The Client Secret of the Azure AD application.\n  - client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n- facebook - (Optional) A Facebook authentication block.\n  - app_id - (Optional) The App ID of the Facebook application.\n  - app_secret - (Optional) The App Secret of the Facebook application.\n  - app_secret_setting_name - (Optional) The app setting name that contains the app secret.\n  - oauth_scopes - (Optional) A list of OAuth scopes to request.\n- github - (Optional) A GitHub authentication block.\n  - client_id - (Optional) The Client ID of the GitHub application.\n  - client_secret - (Optional) The Client Secret of the GitHub application.\n  - client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n  - oauth_scopes - (Optional) A list of OAuth scopes to request.\n- google - (Optional) A Google authentication block.\n  - client_id - (Optional) The Client ID of the Google application.\n  - client_secret - (Optional) The Client Secret of the Google application.\n  - client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n  - oauth_scopes - (Optional) A list of OAuth scopes to request.\n- microsoft - (Optional) A Microsoft authentication block.\n  - client_id - (Optional) The Client ID of the Microsoft application.\n  - client_secret - (Optional) The Client Secret of the Microsoft application.\n  - client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n  - oauth_scopes - (Optional) A list of OAuth scopes to request.\n- twitter - (Optional) A Twitter authentication block.\n  - consumer_key - (Optional) The consumer key of the Twitter application.\n  - consumer_secret - (Optional) The consumer secret of the Twitter application.\n  - consumer_secret_setting_name - (Optional) The app setting name that contains the consumer secret.\n"
  type = object({
    additional_login_parameters    = optional(map(string))
    allowed_external_redirect_urls = optional(list(string))
    default_provider               = optional(string)
    enabled                        = optional(bool, false)
    issuer                         = optional(string)
    runtime_version                = optional(string)
    token_refresh_extension_hours  = optional(number, 72)
    token_store_enabled            = optional(bool, false)
    unauthenticated_client_action  = optional(string)
    active_directory = optional(object({
      client_id                  = optional(string)
      allowed_audiences          = optional(list(string))
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
    }))
    facebook = optional(object({
      app_id                  = optional(string)
      app_secret              = optional(string)
      app_secret_setting_name = optional(string)
      oauth_scopes            = optional(list(string))
    }))
    github = optional(object({
      client_id                  = optional(string)
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
      oauth_scopes               = optional(list(string))
    }))
    google = optional(object({
      client_id                  = optional(string)
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
      oauth_scopes               = optional(list(string))
    }))
    microsoft = optional(object({
      client_id                  = optional(string)
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
      oauth_scopes               = optional(list(string))
    }))
    twitter = optional(object({
      consumer_key                 = optional(string)
      consumer_secret              = optional(string)
      consumer_secret_setting_name = optional(string)
    }))
  })
  default = null
}

variable "auth_settings_v2" {
  description = "Authentication settings V2 configuration for the App Service. Mirrors the API structure.\n\n- auth_enabled - (Optional) Is authentication enabled? Defaults to false.\n- config_file_path - (Optional) The path to the auth configuration file.\n- excluded_paths - (Optional) A list of paths excluded from authentication.\n- forward_proxy_convention - (Optional) The convention for forwarding proxy headers. Defaults to NoProxy.\n- forward_proxy_custom_host_header_name - (Optional) The custom host header name for the forward proxy.\n- forward_proxy_custom_proto_header_name - (Optional) The custom proto header name for the forward proxy.\n- http_route_api_prefix - (Optional) The prefix for the HTTP route API. Defaults to /.auth.\n- redirect_to_provider - (Optional) The default authentication provider when multiple providers are configured.\n- require_authentication - (Optional) Should authentication be required? Defaults to false.\n- require_https - (Optional) Should HTTPS be required? Defaults to true.\n- runtime_version - (Optional) The runtime version of the auth module. Defaults to ~1.\n- unauthenticated_client_action - (Optional) The action for unauthenticated requests. Defaults to RedirectToLoginPage.\n- identity_providers - (Optional) The identity providers configuration. See variable description in the submodule for full details.\n- login - (Optional) The login configuration. See variable description in the submodule for full details.\n"
  type = object({
    auth_enabled                           = optional(bool, false)
    config_file_path                       = optional(string)
    excluded_paths                         = optional(list(string))
    forward_proxy_convention               = optional(string, "NoProxy")
    forward_proxy_custom_host_header_name  = optional(string)
    forward_proxy_custom_proto_header_name = optional(string)
    http_route_api_prefix                  = optional(string, "/.auth")
    redirect_to_provider                   = optional(string)
    require_authentication                 = optional(bool, false)
    require_https                          = optional(bool, true)
    runtime_version                        = optional(string, "~1")
    unauthenticated_client_action          = optional(string, "RedirectToLoginPage")
    identity_providers = optional(object({
      apple = optional(object({
        enabled = optional(bool)
        login = optional(object({
          scopes = optional(list(string))
        }))
        registration = optional(object({
          client_id                  = optional(string)
          client_secret_setting_name = optional(string)
        }))
      }))
      azure_active_directory = optional(object({
        enabled             = optional(bool)
        is_auto_provisioned = optional(bool)
        login = optional(object({
          disable_www_authenticate = optional(bool)
          login_parameters         = optional(list(string))
        }))
        registration = optional(object({
          client_id                                          = optional(string)
          client_secret_certificate_issuer                   = optional(string)
          client_secret_certificate_subject_alternative_name = optional(string)
          client_secret_certificate_thumbprint               = optional(string)
          client_secret_setting_name                         = optional(string)
          open_id_issuer                                     = optional(string)
        }))
        validation = optional(object({
          allowed_audiences = optional(list(string))
          default_authorization_policy = optional(object({
            allowed_applications = optional(list(string))
            allowed_principals = optional(object({
              groups     = optional(list(string))
              identities = optional(list(string))
            }))
          }))
          jwt_claim_checks = optional(object({
            allowed_client_applications = optional(list(string))
            allowed_groups              = optional(list(string))
          }))
        }))
      }))
      azure_static_web_apps = optional(object({
        enabled = optional(bool)
        registration = optional(object({
          client_id = optional(string)
        }))
      }))
      custom_open_id_connect_providers = optional(map(object({
        enabled = optional(bool)
        login = optional(object({
          name_claim_type = optional(string)
          scopes          = optional(list(string))
        }))
        registration = optional(object({
          client_id = optional(string)
          client_credential = optional(object({
            method                     = optional(string)
            client_secret_setting_name = optional(string)
          }))
          open_id_connect_configuration = optional(object({
            authorization_endpoint           = optional(string)
            certification_uri                = optional(string)
            issuer                           = optional(string)
            token_endpoint                   = optional(string)
            well_known_open_id_configuration = optional(string)
          }))
        }))
      })))
      facebook = optional(object({
        enabled           = optional(bool)
        graph_api_version = optional(string)
        login = optional(object({
          scopes = optional(list(string))
        }))
        registration = optional(object({
          app_id                  = optional(string)
          app_secret_setting_name = optional(string)
        }))
      }))
      github = optional(object({
        enabled = optional(bool)
        login = optional(object({
          scopes = optional(list(string))
        }))
        registration = optional(object({
          client_id                  = optional(string)
          client_secret_setting_name = optional(string)
        }))
      }))
      google = optional(object({
        enabled = optional(bool)
        login = optional(object({
          scopes = optional(list(string))
        }))
        registration = optional(object({
          client_id                  = optional(string)
          client_secret_setting_name = optional(string)
        }))
        validation = optional(object({
          allowed_audiences = optional(list(string))
        }))
      }))
      legacy_microsoft_account = optional(object({
        enabled = optional(bool)
        login = optional(object({
          scopes = optional(list(string))
        }))
        registration = optional(object({
          client_id                  = optional(string)
          client_secret_setting_name = optional(string)
        }))
        validation = optional(object({
          allowed_audiences = optional(list(string))
        }))
      }))
      twitter = optional(object({
        enabled = optional(bool)
        registration = optional(object({
          consumer_key                 = optional(string)
          consumer_secret_setting_name = optional(string)
        }))
      }))
    }))
    login = optional(object({
      allowed_external_redirect_urls = optional(list(string))
      cookie_expiration = optional(object({
        convention         = optional(string, "FixedTime")
        time_to_expiration = optional(string, "08:00:00")
      }))
      nonce = optional(object({
        nonce_expiration_interval = optional(string, "00:05:00")
        validate_nonce            = optional(bool, true)
      }))
      preserve_url_fragments_for_logins = optional(bool, false)
      routes = optional(object({
        logout_endpoint = optional(string)
      }))
      token_store = optional(object({
        azure_blob_storage = optional(object({
          sas_url_setting_name = optional(string)
        }))
        enabled = optional(bool, false)
        file_system = optional(object({
          directory = optional(string)
        }))
        token_refresh_extension_hours = optional(number, 72)
      }))
    }))
  })
  default = null
}

variable "auto_generated_domain_name_label_scope" {
  description = "(Optional) The scope of the auto-generated domain name label. Possible values are NoReuse, ResourceGroupReuse, SubscriptionReuse, and TenantReuse."
  type        = string
  default     = null
}

variable "backup" {
  description = "A map of backup settings for the App Service.\n\n- enabled - (Optional) Is backup enabled? Defaults to true.\n- name - (Optional) The name of the backup.\n- storage_account_url - (Optional) The SAS URL to the Storage Account container for backup.\n- schedule - (Optional) A map of backup schedule settings.\n  - frequency_interval - (Optional) How often the backup should be executed.\n  - frequency_unit - (Optional) The unit of time for the backup frequency. Possible values are Day and Hour.\n  - keep_at_least_one_backup - (Optional) Should at least one backup always be kept?\n  - retention_period_days - (Optional) The number of days to retain backups.\n  - start_time - (Optional) The start time for the backup schedule.\n"
  type = map(object({
    enabled             = optional(bool, true)
    name                = optional(string)
    storage_account_url = optional(string)
    schedule = optional(map(object({
      frequency_interval       = optional(number)
      frequency_unit           = optional(string)
      keep_at_least_one_backup = optional(bool)
      retention_period_days    = optional(number)
      start_time               = optional(string)
    })))
  }))
  default = {}
}

variable "builtin_logging_enabled" {
  description = "Should builtin logging be enabled for the Function App? Defaults to true."
  type        = bool
  default     = true
}

variable "bundle_version" {
  description = "The version of the extension bundle to use. Defaults to [1.*, 2.0.0). (Logic App)"
  type        = string
  default     = "[1.*, 2.0.0)"
}

variable "client_affinity_enabled" {
  description = "Should client affinity be enabled for the App Service? Defaults to false."
  type        = bool
  default     = false
}

variable "client_affinity_partitioning_enabled" {
  description = "(Optional) Should client affinity partitioning (CHIPS cookie partitioning) be enabled? When enabled, the affinity cookie uses the CHIPS partitioned attribute."
  type        = bool
  default     = null
}

variable "client_affinity_proxy_enabled" {
  description = "(Optional) Should client affinity proxy be enabled? When enabled, the X-Forwarded-Host header overrides the host value used for affinity cookie routing."
  type        = bool
  default     = null
}

variable "client_certificate_enabled" {
  description = "Should client certificate be enabled for the App Service? Defaults to false."
  type        = bool
  default     = false
}

variable "client_certificate_exclusion_paths" {
  description = "The client certificate exclusion paths for the App Service."
  type        = string
  default     = null
}

variable "client_certificate_mode" {
  description = "The client certificate mode for the App Service. Possible values are Required, Optional, and OptionalInteractiveUser. Defaults to Required."
  type        = string
  default     = "Required"
}

variable "connection_strings" {
  description = "A map of connection strings to assign to the App Service.\n- name - (Optional) The name of the connection string.\n- type - (Optional) The type of the connection string.\n- value - (Optional) The value of the connection string.\n"
  type = map(object({
    name  = optional(string)
    type  = optional(string)
    value = optional(string)
  }))
  default = {}
}

variable "container_size" {
  description = "(Optional) The size of the function container in MB. Only applicable to Function Apps under a Consumption plan."
  type        = number
  default     = null
}

variable "content_share_force_disabled" {
  description = "Should content share be force disabled for the Function App? Defaults to false."
  type        = bool
  default     = false
}

variable "custom_domains" {
  description = "A map of custom domains to assign to the App Service.\n\n- slot_as_target - (Optional) Should the slot be used as the target? Defaults to false.\n- app_service_slot_key - (Optional) The key of the deployment slot to target.\n- create_certificate - (Optional) Should a managed certificate be created? Defaults to false.\n- certificate_name - (Optional) The name of the certificate.\n- certificate_location - (Optional) The location of the certificate.\n- pfx_blob - (Optional) The PFX blob for the certificate.\n- pfx_password - (Optional) The password for the PFX certificate.\n- hostname - (Optional) The custom domain hostname.\n- app_service_name - (Optional) The App Service name.\n- app_service_plan_resource_id - (Optional) The resource ID of the App Service Plan.\n- key_vault_secret_id - (Optional) The Key Vault secret ID for the certificate.\n- key_vault_id - (Optional) The Key Vault ID for the certificate.\n- zone_resource_group_name - (Optional) The resource group of the DNS zone.\n- resource_group_name - (Optional) The resource group name.\n- ssl_state - (Optional) The SSL state. Possible values are IpBasedEnabled and SniEnabled.\n- inherit_tags - (Optional) Should tags be inherited from the parent? Defaults to true.\n- tags - (Optional) Tags to apply to the custom domain resources.\n- thumbprint - (Optional) The certificate thumbprint value.\n- thumbprint_key - (Optional) The key to look up the certificate thumbprint.\n- ttl - (Optional) The TTL for DNS records. Defaults to 300.\n- validation_type - (Optional) The domain validation type. Defaults to cname-delegation.\n- create_cname_records - (Optional) Should CNAME records be created? Defaults to false.\n- cname_name - (Optional) The CNAME record name.\n- cname_zone_name - (Optional) The DNS zone name for the CNAME record.\n- cname_record - (Optional) The CNAME record value.\n- cname_target_resource_id - (Optional) The target resource ID for the CNAME record.\n- create_txt_records - (Optional) Should TXT records be created? Defaults to false.\n- txt_name - (Optional) The TXT record name.\n- txt_zone_name - (Optional) The DNS zone name for the TXT record.\n- txt_records - (Optional) A map of TXT records with value attribute.\n"
  type = map(object({
    slot_as_target               = optional(bool, false)
    app_service_slot_key         = optional(string)
    create_certificate           = optional(bool, false)
    certificate_name             = optional(string)
    certificate_location         = optional(string)
    pfx_blob                     = optional(string)
    pfx_password                 = optional(string)
    hostname                     = optional(string)
    app_service_name             = optional(string)
    app_service_plan_resource_id = optional(string)
    key_vault_secret_id          = optional(string)
    key_vault_id                 = optional(string)
    zone_resource_group_name     = optional(string)
    resource_group_name          = optional(string)
    ssl_state                    = optional(string)
    inherit_tags                 = optional(bool, true)
    tags                         = optional(map(any), {})
    thumbprint                   = optional(string)
    thumbprint_key               = optional(string)
    ttl                          = optional(number, 300)
    validation_type              = optional(string, "cname-delegation")
    create_cname_records         = optional(bool, false)
    cname_name                   = optional(string)
    cname_zone_name              = optional(string)
    cname_record                 = optional(string)
    cname_target_resource_id     = optional(string)
    create_txt_records           = optional(bool, false)
    txt_name                     = optional(string)
    txt_zone_name                = optional(string)
    txt_records                  = optional(map(object({ value = string })))
  }))
  default = {}
}

variable "daily_memory_time_quota" {
  description = "(Optional) The amount of memory in gigabyte-seconds that your application is allowed to consume per day. Setting this value only affects Function Apps under the consumption plan. Defaults to 0."
  type        = number
  default     = 0
}

variable "dapr_config" {
  description = "(Optional) Dapr configuration for the App Service. Only applicable to apps hosted in Azure Container Apps environments.\n\n- app_id - (Optional) The Dapr app identifier.\n- app_port - (Optional) The port the application is listening on.\n- enable_api_logging - (Optional) Should API logging be enabled for Dapr?\n- enabled - (Optional) Is Dapr enabled?\n- http_max_request_size - (Optional) The maximum size of HTTP request body in MB.\n- http_read_buffer_size - (Optional) The maximum size of HTTP header read buffer in KB.\n- log_level - (Optional) The Dapr log level. Possible values are debug, error, info, and warn.\n"
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

variable "deployment_slots" {
  description = "A map of deployment slots to create for the App Service.\n\n- name - (Optional) The name of the slot.\n- auto_generated_domain_name_label_scope - (Optional) The scope of the auto-generated domain name label.\n- client_affinity_enabled - (Optional) Should client affinity be enabled? Defaults to false.\n- client_affinity_partitioning_enabled - (Optional) Should client affinity partitioning (CHIPS) be enabled?\n- client_affinity_proxy_enabled - (Optional) Should client affinity proxy be enabled?\n- client_certificate_enabled - (Optional) Should client certificates be enabled? Defaults to false.\n- client_certificate_exclusion_paths - (Optional) Paths to exclude from client certificate authentication.\n- client_certificate_mode - (Optional) The client certificate mode. Defaults to Required.\n- container_size - (Optional) The size of the function container in MB.\n- dapr_config - (Optional) Dapr configuration object.\n- dns_configuration - (Optional) DNS configuration object.\n- enabled - (Optional) Is the slot enabled? Defaults to true.\n- end_to_end_encryption_enabled - (Optional) Should end-to-end encryption be enabled?\n- ftp_publish_basic_authentication_enabled - (Optional) Should FTP basic authentication be enabled? Defaults to false.\n- hosting_environment_id - (Optional) The resource ID of the App Service Environment.\n- host_names_disabled - (Optional) Should public hostnames be disabled?\n- https_only - (Optional) Should the slot only be accessible over HTTPS? Defaults to true.\n- hyper_v - (Optional) Should the slot run in Hyper-V isolation?\n- ip_mode - (Optional) The IP mode. Possible values: IPv4, IPv4AndIPv6, IPv6.\n- key_vault_reference_identity - (Optional) The identity to use for Key Vault references.\n- managed_environment_id - (Optional) The Azure Container Apps managed environment ID.\n- managed_identities - (Optional) Controls the Managed Identity configuration on the deployment slot. Each slot has its own independent identity configuration.\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled. Defaults to false.\n  - user_assigned_resource_ids - (Optional) Specifies a set of User Assigned Managed Identity resource IDs to be assigned. Defaults to [].\n- public_network_access_enabled - (Optional) Should public network access be enabled? Defaults to false.\n- redundancy_mode - (Optional) The site redundancy mode.\n- resource_config - (Optional) Resource config for Container App environment hosted apps.\n- scm_site_also_stopped - (Optional) Should the SCM site also be stopped?\n- server_farm_id - (Optional) The server farm resource ID to use for the slot.\n- ssh_enabled - (Optional) Should SSH be enabled?\n- storage_account_required - (Optional) Should a storage account be required?\n- tags - (Optional) Tags to apply to the slot.\n- virtual_network_subnet_id - (Optional) The subnet ID for VNet integration.\n- vnet_route_all_traffic - (Optional) Should all outbound traffic use VNet routing? Defaults to false.\n- vnet_application_traffic_enabled - (Optional) Should application traffic use VNet routing? Defaults to false.\n- vnet_backup_restore_enabled - (Optional) Should backup/restore traffic use VNet routing? Defaults to false.\n- vnet_content_share_enabled - (Optional) Should content share traffic use VNet routing? Defaults to false.\n- vnet_image_pull_enabled - (Optional) Should image pull traffic use VNet routing? Defaults to false.\n- webdeploy_publish_basic_authentication_enabled - (Optional) Should WebDeploy basic authentication be enabled? Defaults to false.\n- workload_profile_name - (Optional) The workload profile name.\n- app_settings - (Optional) App settings for the slot.\n- site_config - (Optional) Site configuration for the slot.\n  - always_on - (Optional) Should the slot always be on? Defaults to true.\n  - api_definition_url - (Optional) The URL of the API definition.\n  - api_management_api_id - (Optional) The ID of the API Management API.\n  - app_command_line - (Optional) The App command line to launch.\n  - app_scale_limit - (Optional) The number of workers this function app can scale out to.\n  - auto_swap_slot_name - (Optional) The name of the slot to auto swap with.\n  - container_registry_managed_identity_client_id - (Optional) The Client ID of the MSI for Azure Container Registry.\n  - container_registry_use_managed_identity - (Optional) Should connections for Azure Container Registry use MSI.\n  - default_documents - (Optional) Specifies a list of Default Documents.\n  - detailed_error_logging_enabled - (Optional) Should detailed error logging be enabled?\n  - document_root - (Optional) The document root path.\n  - elastic_instance_minimum - (Optional) The number of minimum instances for Elastic Premium plans.\n  - elastic_web_app_scale_limit - (Optional) The maximum number of workers for Elastic scale.\n  - ftps_state - (Optional) State of FTP / FTPS service. Defaults to FtpsOnly.\n  - handler_mappings - (Optional) A list of handler mappings (Windows IIS).\n    - arguments - (Optional) The arguments to pass to the script processor.\n    - extension - (Optional) The file extension to handle.\n    - script_processor - (Optional) The path to the script processor executable.\n  - health_check_path - (Optional) The path to be checked for health.\n  - http2_enabled - (Optional) Enable HTTP2 protocol. Defaults to false.\n  - http_logging_enabled - (Optional) Should HTTP logging be enabled?\n  - ip_restriction_default_action - (Optional) Default action for IP restrictions. Defaults to Allow.\n  - limits - (Optional) Resource limits.\n    - max_disk_size_in_mb - (Optional) The maximum disk size in MB.\n    - max_memory_in_mb - (Optional) The maximum memory in MB.\n    - max_percentage_cpu - (Optional) The maximum CPU percentage.\n  - load_balancing_mode - (Optional) The Site load balancing mode. Defaults to LeastRequests.\n  - logs_directory_size_limit - (Optional) The HTTP log directory size limit in MB.\n  - managed_pipeline_mode - (Optional) Managed pipeline mode. Defaults to Integrated.\n  - metadata - (Optional) A list of name-value pairs for siteConfig metadata (e.g. CURRENT_STACK). Auto-computed from application_stack if not specified. User-supplied entries take precedence.\n    - name - (Required) The metadata key.\n    - value - (Required) The metadata value.\n  - min_tls_cipher_suite - (Optional) The minimum TLS cipher suite.\n  - minimum_tls_version - (Optional) The minimum TLS version. Defaults to 1.3.\n  - pre_warmed_instance_count - (Optional) The number of pre-warmed instances.\n  - remote_debugging_enabled - (Optional) Should Remote Debugging be enabled? Defaults to false.\n  - remote_debugging_version - (Optional) The Remote Debugging Version.\n  - request_tracing_enabled - (Optional) Should request tracing be enabled?\n  - request_tracing_expiration_time - (Optional) The expiration time for request tracing.\n  - runtime_scale_monitoring_enabled - (Optional) Should runtime scale monitoring be enabled?\n  - scm_ip_restriction_default_action - (Optional) Default action for SCM IP restrictions. Defaults to Allow.\n  - scm_minimum_tls_version - (Optional) SCM minimum TLS version. Defaults to 1.2.\n  - scm_use_main_ip_restriction - (Optional) Should SCM use the main IP restriction? Defaults to false.\n  - tracing_options - (Optional) Azure tracing options.\n  - use_32_bit_worker - (Optional) Use a 32-bit worker process. Defaults to false.\n  - vnet_private_ports_count - (Optional) The number of private ports for VNet integration.\n  - vnet_route_all_enabled - (Optional) Route all outbound traffic through VNet. Defaults to false.\n  - website_time_zone - (Optional) The time zone for the website.\n  - websockets_enabled - (Optional) Enable Web Sockets. Defaults to false.\n  - worker_count - (Optional) The number of Workers.\n  - application_insights_connection_string - (Optional) The connection string for Application Insights.\n  - application_insights_key - (Optional) The instrumentation key for Application Insights.\n  - application_stack - (Optional) Application stack configuration.\n    - docker - (Optional) Docker configuration with docker_image_name, docker_registry_url, and docker_image_tag.\n    - dotnet - (Optional) .NET configuration with dotnet_version, current_stack, use_custom_runtime, and use_dotnet_isolated_runtime.\n    - java - (Optional) Java configuration with java_version, java_container, and java_container_version.\n    - node - (Optional) Node.js configuration with node_version.\n    - php - (Optional) PHP configuration with php_version.\n    - python - (Optional) Python configuration with python_version.\n    - powershell - (Optional) PowerShell configuration with powershell_version.\n- lock - (Optional) The lock to apply to the slot.\n  - kind - (Required) The type of lock. Possible values are CanNotDelete and ReadOnly.\n  - name - (Optional) The name of the lock.\n- private_endpoints - (Optional) Private endpoints for the slot.\n  - name - (Optional) The name of the private endpoint.\n  - role_assignments - (Optional) A map of role assignments for the private endpoint.\n    - role_definition_id_or_name - (Required) The ID or name of the role definition.\n    - principal_id - (Required) The ID of the principal.\n    - description - (Optional) The description of the role assignment.\n    - skip_service_principal_aad_check - (Optional) Skip the AAD check. Defaults to false.\n    - condition - (Optional) The condition for the role assignment.\n    - condition_version - (Optional) The condition version.\n    - delegated_managed_identity_resource_id - (Optional) The delegated managed identity resource ID.\n    - principal_type - (Optional) The type of the principal.\n  - lock - (Optional) The lock for the private endpoint.\n    - kind - (Required) The type of lock.\n    - name - (Optional) The name of the lock.\n  - tags - (Optional) Tags for the private endpoint.\n  - subnet_resource_id - (Required) The resource ID of the subnet.\n  - private_dns_zone_group_name - (Optional) The private DNS zone group name. Defaults to default.\n  - private_dns_zone_resource_ids - (Optional) A set of private DNS zone resource IDs.\n  - application_security_group_associations - (Optional) A map of application security group associations.\n  - private_service_connection_name - (Optional) The private service connection name.\n  - network_interface_name - (Optional) The network interface name.\n  - location - (Optional) The Azure location.\n  - resource_group_name - (Optional) The resource group name.\n  - ip_configurations - (Optional) A map of IP configurations.\n    - name - (Required) The name of the IP configuration.\n    - private_ip_address - (Required) The private IP address.\n- role_assignments - (Optional) Role assignments for the slot.\n  - role_definition_id_or_name - (Required) The ID or name of the role definition.\n  - principal_id - (Required) The ID of the principal.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) Skip the AAD check. Defaults to false.\n  - condition - (Optional) The condition for the role assignment.\n  - condition_version - (Optional) The condition version.\n  - delegated_managed_identity_resource_id - (Optional) The delegated managed identity resource ID.\n  - principal_type - (Optional) The type of the principal.\n- storage_shares_to_mount - (Optional) A map of storage shares to mount to the deployment slot.\n  - account_name - (Required) The name of the Storage Account.\n  - mount_path - (Required) The path to mount the share at.\n  - name - (Required) The name of the storage mount.\n  - share_name - (Required) The name of the file share.\n  - type - (Optional) The type of storage. Defaults to AzureFiles.\n- connection_strings - (Optional) A map of connection strings for the slot.\n  - name - (Optional) The name of the connection string.\n  - type - (Optional) The type of the connection string.\n  - value - (Optional) The value of the connection string.\n- zip_deploy_file - (Optional) The path to the zip file to deploy to the slot.\n- zip_deploy_wait_duration - (Optional) The duration to wait after the slot is configured before triggering zip deploy. Defaults to 60s.\n"
  type = map(object({
    name                                   = optional(string)
    auto_generated_domain_name_label_scope = optional(string)
    client_affinity_enabled                = optional(bool, false)
    client_affinity_partitioning_enabled   = optional(bool)
    client_affinity_proxy_enabled          = optional(bool)
    client_certificate_enabled             = optional(bool, false)
    client_certificate_exclusion_paths     = optional(string, null)
    client_certificate_mode                = optional(string, "Required")
    container_size                         = optional(number)
    dapr_config = optional(object({
      app_id                = optional(string)
      app_port              = optional(number)
      enable_api_logging    = optional(bool)
      enabled               = optional(bool)
      http_max_request_size = optional(number)
      http_read_buffer_size = optional(number)
      log_level             = optional(string)
    }))
    dns_configuration = optional(object({
      dns_alt_server            = optional(string)
      dns_max_cache_timeout     = optional(number)
      dns_retry_attempt_count   = optional(number)
      dns_retry_attempt_timeout = optional(number)
      dns_servers               = optional(list(string))
    }))
    enabled                                  = optional(bool, true)
    end_to_end_encryption_enabled            = optional(bool)
    ftp_publish_basic_authentication_enabled = optional(bool, false)
    hosting_environment_id                   = optional(string)
    host_names_disabled                      = optional(bool)
    https_only                               = optional(bool, true)
    hyper_v                                  = optional(bool)
    ip_mode                                  = optional(string)
    key_vault_reference_identity             = optional(string, null)
    managed_environment_id                   = optional(string)
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }), {})
    public_network_access_enabled = optional(bool, false)
    redundancy_mode               = optional(string)
    resource_config = optional(object({
      cpu    = optional(number)
      memory = optional(string)
    }))
    scm_site_also_stopped                          = optional(bool)
    server_farm_id                                 = optional(string, null)
    ssh_enabled                                    = optional(bool)
    storage_account_required                       = optional(bool)
    tags                                           = optional(map(string))
    virtual_network_subnet_id                      = optional(string, null)
    vnet_route_all_traffic                         = optional(bool, false)
    vnet_application_traffic_enabled               = optional(bool, false)
    vnet_backup_restore_enabled                    = optional(bool, false)
    vnet_content_share_enabled                     = optional(bool, false)
    vnet_image_pull_enabled                        = optional(bool, false)
    webdeploy_publish_basic_authentication_enabled = optional(bool, false)
    workload_profile_name                          = optional(string)
    app_settings                                   = optional(map(string), {})
    site_config = optional(object({
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
    }), {})
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    private_endpoints = optional(map(object({
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
    })), {})
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
    storage_shares_to_mount = optional(map(object({
      account_name = string
      mount_path   = string
      name         = string
      share_name   = string
      type         = optional(string, "AzureFiles")
    })), {})
    connection_strings = optional(map(object({
      name  = optional(string)
      type  = optional(string)
      value = optional(string)
    })), {})
    zip_deploy_file          = optional(string)
    zip_deploy_wait_duration = optional(string, "60s")
  }))
  default = {}
}

variable "deployment_slots_inherit_lock" {
  description = "Whether to inherit the lock from the parent resource for the deployment slots. Defaults to true."
  type        = bool
  default     = true
}

variable "diagnostic_settings" {
  description = "  A map of diagnostic settings to create on the App Service Environment (ASE). The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - logs - (Optional) A set of log configuration blocks.\n    - category - (Optional) The log category.\n    - category_group - (Optional) The log category group.\n    - enabled - (Optional) Is the log enabled? Defaults to true.\n    - retention_policy - (Optional) A retention policy block.\n      - days - (Optional) The number of days to retain. Defaults to 0.\n      - enabled - (Optional) Is the retention policy enabled? Defaults to false.\n  - metrics - (Optional) A set of metric configuration blocks.\n    - category - (Optional) The metric category.\n    - enabled - (Optional) Is the metric enabled? Defaults to true.\n    - retention_policy - (Optional) A retention policy block.\n      - days - (Optional) The number of days to retain. Defaults to 0.\n      - enabled - (Optional) Is the retention policy enabled? Defaults to false.\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs.\n"
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

variable "dns_configuration" {
  description = "(Optional) DNS configuration for the App Service.\n\n- dns_alt_server - (Optional) Alternate DNS server to be used by the App Service.\n- dns_max_cache_timeout - (Optional) Custom time for DNS to be cached in seconds.\n- dns_retry_attempt_count - (Optional) Total number of retries for DNS lookup.\n- dns_retry_attempt_timeout - (Optional) Timeout for a single DNS lookup in seconds.\n- dns_servers - (Optional) List of custom DNS servers to be used by the App Service.\n"
  type = object({
    dns_alt_server            = optional(string)
    dns_max_cache_timeout     = optional(number)
    dns_retry_attempt_count   = optional(number)
    dns_retry_attempt_timeout = optional(number)
    dns_servers               = optional(list(string))
  })
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Is the App Service enabled? Defaults to true."
  type        = bool
  default     = true
}

variable "end_to_end_encryption_enabled" {
  description = "(Optional) Should end-to-end encryption be enabled between the App Service front ends and the workers?"
  type        = bool
  default     = null
}

variable "fc1_runtime_name" {
  description = "The Runtime of the Flex Consumption Function App. Possible values are node, dotnet-isolated, powershell, python, java."
  type        = string
  default     = null
}

variable "fc1_runtime_version" {
  description = "The Runtime version of the Flex Consumption Function App."
  type        = string
  default     = null
}

variable "ftp_publish_basic_authentication_enabled" {
  description = "Should basic authentication be enabled for FTP publish? Defaults to false."
  type        = bool
  default     = false
}

variable "function_app_uses_fc1" {
  description = "Should this Function App run on a Flex Consumption Plan? Defaults to false."
  type        = bool
  default     = false
}

variable "functions_extension_version" {
  description = "The version of the Azure Functions runtime to use. Defaults to ~4."
  type        = string
  default     = "~4"
}

variable "host_names_disabled" {
  description = "(Optional) Should the public hostnames of the app be disabled? When true, the app is only accessible via the API management process."
  type        = bool
  default     = null
}

variable "hosting_environment_id" {
  description = "(Optional) The resource ID of the App Service Environment to host this App Service in."
  type        = string
  default     = null
}

variable "https_only" {
  description = "Should the App Service only be accessible over HTTPS? Defaults to true."
  type        = bool
  default     = true
}

variable "hyper_v" {
  description = "(Optional) Should the App Service run in Hyper-V isolation?"
  type        = bool
  default     = null
}

variable "instance_memory_in_mb" {
  description = "The amount of memory to allocate for Flex Consumption instances. Defaults to 2048."
  type        = number
  default     = 2048
}

variable "ip_mode" {
  description = "(Optional) Specifies the IP mode of the app. Possible values are IPv4, IPv4AndIPv6, and IPv6."
  type        = string
  default     = null
}

variable "key_vault_reference_identity" {
  description = "The identity to use for Key Vault references."
  type        = string
  default     = null
}

variable "kind" {
  description = "The type of App Service to deploy. This maps to the ARM API kind property.\nPossible values are functionapp, webapp and logicapp. Defaults to webapp.\n"
  type        = string
  default     = "webapp"
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock level to apply.\n\n- kind - (Required) The type of lock. Possible values are CanNotDelete and ReadOnly.\n- name - (Optional) The name of the lock.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "logic_app_runtime_version" {
  description = "The runtime version for the Logic App. Defaults to ~4."
  type        = string
  default     = "~4"
}

variable "logs" {
  description = "A map of logs configuration for the App Service.\n\n- application_logs - (Optional) A map of application log settings.\n  - azure_blob_storage - (Optional) Azure Blob Storage configuration for application logs.\n    - level - (Optional) The log level. Defaults to Off.\n    - retention_in_days - (Optional) The retention period in days. Defaults to 0.\n    - sas_url - (Required) The SAS URL to the Azure Blob Storage container.\n  - file_system - (Optional) File system configuration for application logs.\n    - level - (Optional) The file system log level. Defaults to Off.\n- detailed_error_messages - (Optional) Should detailed error messages be enabled? Defaults to false.\n- failed_requests_tracing - (Optional) Should failed request tracing be enabled? Defaults to false.\n- http_logs - (Optional) A map of HTTP log settings.\n  - azure_blob_storage - (Optional) Azure Blob Storage configuration for HTTP logs.\n    - retention_in_days - (Optional) The retention period in days. Defaults to 0.\n    - sas_url - (Required) The SAS URL to the Azure Blob Storage container.\n  - file_system - (Optional) File system configuration for HTTP logs.\n    - retention_in_days - (Optional) The retention period in days. Defaults to 0.\n    - retention_in_mb - (Required) The maximum size in MB before being rotated.\n"
  type = map(object({
    application_logs = optional(map(object({
      azure_blob_storage = optional(object({
        level             = optional(string, "Off")
        retention_in_days = optional(number, 0)
        sas_url           = string
      }))
      file_system = optional(object({
        level = optional(string, "Off")
      }), {})
    })), {})
    detailed_error_messages = optional(bool, false)
    failed_requests_tracing = optional(bool, false)
    http_logs = optional(map(object({
      azure_blob_storage = optional(object({
        retention_in_days = optional(number, 0)
        sas_url           = string
      }))
      file_system = optional(object({
        retention_in_days = optional(number, 0)
        retention_in_mb   = number
      }))
    })), {})
  }))
  default = {}
}

variable "managed_environment_id" {
  description = "(Optional) The Azure Resource Manager ID of the Azure Container Apps managed environment to host this App Service in."
  type        = string
  default     = null
}

variable "managed_identities" {
  description = "Managed identities to be created for the resource.\n\n- system_assigned - (Optional) Should a system-assigned managed identity be created? Defaults to false.\n- user_assigned_resource_ids - (Optional) A set of user-assigned managed identity resource IDs to assign. Defaults to [].\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "maximum_instance_count" {
  description = "The number of workers this function app can scale out to."
  type        = number
  default     = null
}

variable "name" {
  description = "The name which should be used for the App Service."
  type        = string
  default     = ""
}

variable "os_type" {
  description = "The operating system type. Linux sets reserved = true on the ARM resource. Defaults to Linux."
  type        = string
  default     = "Linux"
}

variable "parent_id" {
  description = "The resource ID of the Resource Group where the App Service will be deployed."
  type        = string
  default     = ""
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint.\n  - role_definition_id_or_name - (Required) The ID or name of the role definition.\n  - principal_id - (Required) The ID of the principal.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) Skip the AAD check. Defaults to false.\n  - condition - (Optional) The condition for the role assignment.\n  - condition_version - (Optional) The condition version.\n  - delegated_managed_identity_resource_id - (Optional) The delegated managed identity resource ID.\n  - principal_type - (Optional) The type of the principal.\n- lock - (Optional) The lock level to apply to the private endpoint.\n  - kind - (Required) The type of lock. Possible values are CanNotDelete and ReadOnly.\n  - name - (Optional) The name of the lock.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate.\n- application_security_group_associations - (Optional) A map of resource IDs of application security groups.\n- private_service_connection_name - (Optional) The name of the private service connection.\n- network_interface_name - (Optional) The name of the network interface.\n- location - (Optional) The Azure location. Defaults to the resource group location.\n- resource_group_name - (Optional) The resource group. Defaults to the resource group of this resource.\n- ip_configurations - (Optional) A map of IP configurations for the private endpoint.\n  - name - (Required) The name of the IP configuration.\n  - private_ip_address - (Required) The private IP address.\n"
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
  description = "Should the private endpoints inherit the lock from the parent resource? Defaults to true."
  type        = bool
  default     = true
}

variable "private_endpoints_manage_dns_zone_group" {
  description = "Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally. Defaults to true."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Should the App Service be accessible from the public network? Defaults to false."
  type        = bool
  default     = false
}

variable "redundancy_mode" {
  description = "(Optional) The site redundancy mode. Possible values are ActiveActive, Failover, GeoRedundant, Manual, and None."
  type        = string
  default     = null
}

variable "resource_config" {
  description = "(Optional) Function app resource requirements for Container App environment hosted apps.\n\n- cpu - (Optional) The required number of CPU cores.\n- memory - (Optional) The required memory size (e.g. 1.0Gi).\n"
  type = object({
    cpu    = optional(number)
    memory = optional(string)
  })
  default = null
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are 2.0.\n- delegated_managed_identity_resource_id - The delegated Azure Resource Id which contains a Managed Identity.\n- principal_type - The type of the principal_id. Possible values are User, Group and ServicePrincipal.\n"
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

variable "scm_publish_basic_authentication_enabled" {
  description = "Should basic authentication be enabled for SCM publish? Defaults to true."
  type        = bool
  default     = true
}

variable "scm_site_also_stopped" {
  description = "(Optional) Should the SCM site also be stopped when the app is stopped? Defaults to false."
  type        = bool
  default     = null
}

variable "service_plan_resource_id" {
  description = "The resource ID of the App Service Plan to deploy the App Service in."
  type        = string
  default     = ""
}

variable "site_config" {
  description = "An object that configures the App Service's site configuration. These map to the ARM API siteConfig properties.\n\n- always_on - (Optional) If this App is Always On enabled. Defaults to true.\n- api_definition_url - (Optional) The URL of the API definition.\n- api_management_api_id - (Optional) The ID of the API Management API.\n- app_command_line - (Optional) The App command line to launch.\n- app_scale_limit - (Optional) The number of workers this function app can scale out to.\n- auto_heal_enabled - (Optional) Should Auto Heal be enabled? Maps to autoHealEnabled in the API.\n- auto_heal_rules - (Optional) Configures the Auto Heal rules for the App Service. Maps to autoHealRules in the API.\n  - actions - (Optional) The action to take when the trigger is activated.\n    - action_type - (Required) The type of action. Possible values are Recycle, LogEvent, and CustomAction.\n    - custom_action - (Optional) A custom action block.\n      - exe - (Required) The executable to run.\n      - parameters - (Optional) The parameters to pass to the executable.\n    - min_process_execution_time - (Optional) The minimum process execution time. Defaults to 00:00:00.\n  - triggers - (Optional) The trigger conditions for auto heal.\n    - private_bytes_in_kb - (Optional) The amount of private memory in KB that triggers the action.\n    - requests - (Optional) The request count trigger.\n      - count - (Required) The number of requests within the interval.\n      - time_interval - (Required) The time interval.\n    - slow_requests - (Optional) The slow request trigger.\n      - count - (Required) The number of slow requests within the interval.\n      - time_interval - (Required) The time interval.\n      - time_taken - (Required) The threshold for time taken.\n      - path - (Optional) The request path to match.\n    - slow_requests_with_path - (Optional) A list of slow request triggers with path matching.\n      - count - (Required) The number of slow requests within the interval.\n      - time_interval - (Required) The time interval.\n      - time_taken - (Required) The threshold for time taken.\n      - path - (Optional) The request path to match.\n    - status_codes - (Optional) A list of status code-based triggers.\n      - count - (Required) The number of occurrences within the interval.\n      - time_interval - (Required) The time interval.\n      - status - (Required) The status code.\n      - path - (Optional) The request path to match.\n      - sub_status - (Optional) The sub-status code.\n      - win32_status - (Optional) The Win32 status code.\n    - status_codes_range - (Optional) A list of status code range-based triggers.\n      - count - (Required) The number of occurrences within the interval.\n      - time_interval - (Required) The time interval.\n      - status_codes - (Required) The status code range (e.g. 500-599).\n      - path - (Optional) The request path to match.\n- auto_swap_slot_name - (Optional) The name of the slot to auto swap with.\n- container_registry_managed_identity_client_id - (Optional) The Client ID of the MSI for Azure Container Registry.\n- container_registry_use_managed_identity - (Optional) Should connections for Azure Container Registry use MSI.\n- default_documents - (Optional) Specifies a list of Default Documents.\n- detailed_error_logging_enabled - (Optional) Should detailed error logging be enabled?\n- document_root - (Optional) The document root path.\n- dotnet_framework_version - (Optional) The .NET Framework version. Takes precedence over application_stack.dotnet.dotnet_version.\n- elastic_instance_minimum - (Optional) The number of minimum instances for Elastic Premium plans.\n- elastic_web_app_scale_limit - (Optional) The maximum number of workers for Elastic scale.\n- experiments - (Optional) Traffic routing experiments configuration.\n  - ramp_up_rules - (Optional) A list of ramp-up rules for traffic routing.\n    - action_host_name - (Optional) The hostname of the slot to route traffic to.\n    - change_decision_callback_url - (Optional) URL to a custom decision algorithm.\n    - change_interval_in_minutes - (Optional) Interval in minutes at which to re-evaluate routing percentage.\n    - change_step - (Optional) The percentage to change the routing by at each interval.\n    - max_reroute_percentage - (Optional) The maximum percentage of traffic to reroute.\n    - min_reroute_percentage - (Optional) The minimum percentage of traffic to reroute.\n    - name - (Optional) The name of the ramp-up rule (typically the slot name).\n    - reroute_percentage - (Optional) The current percentage of traffic to reroute.\n- ftps_state - (Optional) State of FTP / FTPS service. Possible values: AllAllowed, FtpsOnly, Disabled. Defaults to FtpsOnly.\n- handler_mappings - (Optional) A list of handler mappings (Windows IIS).\n  - arguments - (Optional) The arguments to pass to the script processor.\n  - extension - (Optional) The file extension to handle.\n  - script_processor - (Optional) The path to the script processor executable.\n- health_check_path - (Optional) The path to be checked for health.\n- http2_enabled - (Optional) Enable HTTP2 protocol. Defaults to false.\n- http20_proxy_flag - (Optional) HTTP/2 proxy flag. 0 = disabled, 1 = pass through HTTP/2, 2 = gRPC only.\n- http_logging_enabled - (Optional) Should HTTP logging be enabled?\n- ip_restriction_default_action - (Optional) Default action for IP restrictions. Defaults to Allow.\n- limits - (Optional) Resource limits for the App Service.\n  - max_disk_size_in_mb - (Optional) The maximum disk size in MB.\n  - max_memory_in_mb - (Optional) The maximum memory in MB.\n  - max_percentage_cpu - (Optional) The maximum CPU percentage.\n- java_container - (Optional) The Java container type (e.g. TOMCAT, JETTY). Direct alternative to application_stack.java.java_container.\n- java_container_version - (Optional) The Java container version. Direct alternative to application_stack.java.java_container_version.\n- java_version - (Optional) The Java version. Direct alternative to application_stack.java.java_version.\n- linux_fx_version - (Optional) The Linux App Framework and version for the App Service. Direct value takes precedence over application_stack derived value.\n- load_balancing_mode - (Optional) The Site load balancing mode. Defaults to LeastRequests.\n- local_mysql_enabled - (Optional) Should Local MySQL be enabled? Defaults to false.\n- logs_directory_size_limit - (Optional) The HTTP log directory size limit in MB.\n- managed_pipeline_mode - (Optional) Managed pipeline mode. Defaults to Integrated.\n- metadata - (Optional) A list of name-value pairs for siteConfig metadata (e.g. CURRENT_STACK). Auto-computed from application_stack if not specified. User-supplied entries take precedence.\n  - name - (Required) The metadata key.\n  - value - (Required) The metadata value.\n- min_tls_cipher_suite - (Optional) The minimum TLS cipher suite. E.g. TLS_AES_256_GCM_SHA384.\n- minimum_tls_version - (Optional) The minimum TLS version. Defaults to 1.3.\n- node_version - (Optional) The Node.js version. Direct alternative to application_stack.node.node_version.\n- php_version - (Optional) The PHP version. Direct alternative to application_stack.php.php_version.\n- powershell_version - (Optional) The PowerShell version. Direct alternative to application_stack.powershell.powershell_version.\n- pre_warmed_instance_count - (Optional) The number of pre-warmed instances.\n- python_version - (Optional) The Python version. Direct alternative to application_stack.python.python_version.\n- remote_debugging_enabled - (Optional) Should Remote Debugging be enabled. Defaults to false.\n- remote_debugging_version - (Optional) The Remote Debugging Version.\n- request_tracing_enabled - (Optional) Should request tracing be enabled?\n- request_tracing_expiration_time - (Optional) The expiration time for request tracing.\n- runtime_scale_monitoring_enabled - (Optional) Should runtime scale monitoring be enabled?\n- scm_ip_restriction_default_action - (Optional) Default action for SCM IP restrictions. Defaults to Allow.\n- scm_minimum_tls_version - (Optional) SCM minimum TLS version. Defaults to 1.2.\n- scm_type - (Optional) The SCM type. Defaults to None.\n- scm_use_main_ip_restriction - (Optional) Should SCM use the main IP restriction.\n- tracing_options - (Optional) Azure tracing options.\n- use_32_bit_worker - (Optional) Use a 32-bit worker process. Defaults to false.\n- vnet_private_ports_count - (Optional) The number of private ports assigned to the app for VNet integration.\n- vnet_route_all_enabled - (Optional) Route all outbound traffic through VNet. Defaults to false.\n- website_time_zone - (Optional) The time zone for the website (e.g. Eastern Standard Time).\n- websockets_enabled - (Optional) Enable Web Sockets. Defaults to false.\n- windows_fx_version - (Optional) The Windows App Framework and version for the App Service. Direct value takes precedence over application_stack derived value.\n- worker_count - (Optional) The number of Workers.\n- application_insights_connection_string - (Optional) The connection string for Application Insights.\n- application_insights_key - (Optional) The instrumentation key for Application Insights.\n- cors - (Optional) CORS configuration.\n  - allowed_origins - (Optional) A list of allowed origins.\n  - support_credentials - (Optional) Should credentials be supported? Defaults to false.\n- ip_restriction - (Optional) A list of IP restriction rules.\n  - action - (Optional) The action. Defaults to Allow.\n  - ip_address - (Optional) The CIDR notation IP address.\n  - name - (Optional) The name of the rule.\n  - priority - (Optional) The priority. Defaults to 65000.\n  - service_tag - (Optional) The service tag.\n  - virtual_network_subnet_id - (Optional) The subnet resource ID.\n  - headers - (Optional) Header-based restrictions.\n    - x_azure_fdid - (Optional) A list of Azure Front Door IDs.\n    - x_fd_health_probe - (Optional) A list of health probe values.\n    - x_forwarded_for - (Optional) A list of forwarded-for addresses.\n    - x_forwarded_host - (Optional) A list of forwarded hosts.\n- scm_ip_restriction - (Optional) A list of SCM IP restriction rules.\n  - action - (Optional) The action. Defaults to Allow.\n  - ip_address - (Optional) The CIDR notation IP address.\n  - name - (Optional) The name of the rule.\n  - priority - (Optional) The priority. Defaults to 65000.\n  - service_tag - (Optional) The service tag.\n  - virtual_network_subnet_id - (Optional) The subnet resource ID.\n  - headers - (Optional) Header-based restrictions.\n    - x_azure_fdid - (Optional) A list of Azure Front Door IDs.\n    - x_fd_health_probe - (Optional) A list of health probe values.\n    - x_forwarded_for - (Optional) A list of forwarded-for addresses.\n    - x_forwarded_host - (Optional) A list of forwarded hosts.\n- application_stack - (Optional) Application stack configuration.\n  - docker - (Optional) Docker configuration.\n    - docker_image_name - (Optional) The Docker image name.\n    - docker_registry_url - (Optional) The Docker registry URL.\n    - docker_image_tag - (Optional) The Docker image tag. Defaults to latest.\n  - dotnet - (Optional) .NET configuration.\n    - dotnet_version - (Optional) The .NET version.\n    - current_stack - (Optional) The current stack.\n    - use_custom_runtime - (Optional) Use a custom runtime? Defaults to false.\n    - use_dotnet_isolated_runtime - (Optional) Use the isolated runtime? Defaults to false.\n  - java - (Optional) Java configuration.\n    - java_version - (Optional) The Java version.\n    - java_container - (Optional) The Java container.\n    - java_container_version - (Optional) The Java container version.\n  - node - (Optional) Node.js configuration.\n    - node_version - (Optional) The Node.js version.\n  - php - (Optional) PHP configuration.\n    - php_version - (Optional) The PHP version.\n  - python - (Optional) Python configuration.\n    - python_version - (Optional) The Python version.\n  - powershell - (Optional) PowerShell configuration.\n    - powershell_version - (Optional) The PowerShell version.\n- virtual_application - (Optional) A list of virtual application configurations.\n  - physical_path - (Optional) The physical path. Defaults to site\\\\wwwroot.\n  - preload_enabled - (Optional) Should preloading be enabled? Defaults to false.\n  - virtual_path - (Optional) The virtual path. Defaults to /.\n  - virtual_directory - (Optional) A list of virtual directories.\n    - physical_path - (Optional) The physical path.\n    - virtual_path - (Optional) The virtual path.\n"
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
    default_documents                             = optional(list(string))
    detailed_error_logging_enabled                = optional(bool)
    document_root                                 = optional(string)
    dotnet_framework_version                      = optional(string)
    elastic_instance_minimum                      = optional(number)
    elastic_web_app_scale_limit                   = optional(number)
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
    health_check_path             = optional(string)
    http2_enabled                 = optional(bool, false)
    http20_proxy_flag             = optional(number)
    http_logging_enabled          = optional(bool)
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
    min_tls_cipher_suite                   = optional(string)
    minimum_tls_version                    = optional(string, "1.3")
    node_version                           = optional(string)
    php_version                            = optional(string)
    powershell_version                     = optional(string)
    pre_warmed_instance_count              = optional(number)
    python_version                         = optional(string)
    remote_debugging_enabled               = optional(bool, false)
    remote_debugging_version               = optional(string)
    request_tracing_enabled                = optional(bool)
    request_tracing_expiration_time        = optional(string)
    runtime_scale_monitoring_enabled       = optional(bool)
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
    cors = optional(object({
      allowed_origins     = optional(list(string))
      support_credentials = optional(bool, false)
    }))
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

variable "slot_sensitive_app_settings" {
  description = "A map of sensitive app settings to apply to the deployment slot(s). The key MUST be the same key as the slot key."
  type        = map(map(string))
  default     = {}
}

variable "slots_storage_shares_to_mount_sensitive_values" {
  description = "A map of sensitive values (Storage Access Key) for the Storage Account SMB file shares to mount to the deployment slots.\nThe key is the supplied input to var.deployment_slots.<slot_key>.storage_shares_to_mount.\nThe value is the secret value (storage access key).\n"
  type        = map(string)
  default     = {}
}

variable "ssh_enabled" {
  description = "(Optional) Should SSH be enabled for the App Service?"
  type        = bool
  default     = null
}

variable "sticky_settings" {
  description = "A map of sticky settings to assign to the App Service.\n\n- app_setting_names - (Optional) A list of app setting names that should be sticky to the slot.\n- connection_string_names - (Optional) A list of connection string names that should be sticky to the slot.\n"
  type = map(object({
    app_setting_names       = optional(list(string))
    connection_string_names = optional(list(string))
  }))
  default = {}
}

variable "storage_account_access_key" {
  description = "The access key of the Storage Account for the Function App."
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "The name of the Storage Account for the Function App."
  type        = string
  default     = null
}

variable "storage_account_required" {
  description = "(Optional) Should a storage account be required for the Function App? When set, the storage account must be specified in the app settings."
  type        = bool
  default     = null
}

variable "storage_account_share_name" {
  description = "The name of the storage account file share (Logic App)."
  type        = string
  default     = null
}

variable "storage_authentication_type" {
  description = "The authentication type for the backend storage account. Possible values are StorageAccountConnectionString, SystemAssignedIdentity, and UserAssignedIdentity."
  type        = string
  default     = null
}

variable "storage_container_endpoint" {
  description = "The backend storage container endpoint for Flex Consumption Function Apps."
  type        = string
  default     = null
}

variable "storage_container_type" {
  description = "The storage container type. The current supported type is blobContainer."
  type        = string
  default     = null
}

variable "storage_shares_to_mount" {
  description = "A map of Storage Account file shares to mount to the App Service.\n\n- access_key - (Required) The access key for the Storage Account.\n- account_name - (Required) The name of the Storage Account.\n- mount_path - (Required) The path to mount the share at within the App Service.\n- name - (Required) The name of the storage mount.\n- share_name - (Required) The name of the file share.\n- type - (Optional) The type of storage. Defaults to AzureFiles.\n"
  type = map(object({
    access_key   = string
    account_name = string
    mount_path   = string
    name         = string
    share_name   = string
    type         = optional(string, "AzureFiles")
  }))
  default = {}
}

variable "storage_user_assigned_identity_id" {
  description = "The ID of the User Assigned Managed Identity for storage."
  type        = string
  default     = null
}

variable "storage_uses_managed_identity" {
  description = "Should the Storage Account use a Managed Identity? Defaults to false."
  type        = bool
  default     = false
}

variable "tags" {
  description = "The map of tags to be applied to the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating the App Service.\n- delete - (Defaults to 30 minutes) Used when deleting the App Service.\n- read - (Defaults to 5 minutes) Used when retrieving the App Service.\n- update - (Defaults to 30 minutes) Used when updating the App Service.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "use_extension_bundle" {
  description = "Should the extension bundle be used? (Logic App) Defaults to true."
  type        = bool
  default     = true
}

variable "virtual_network_backup_restore_enabled" {
  description = "Should backup and restore operations over the linked virtual network be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "virtual_network_subnet_id" {
  description = "The ID of the subnet to deploy the App Service in for regional VNet integration."
  type        = string
  default     = null
}

variable "vnet_application_traffic_enabled" {
  description = "Should application traffic be routed over virtual network? Maps to outboundVnetRouting.applicationTraffic. Defaults to false."
  type        = bool
  default     = false
}

variable "vnet_content_share_enabled" {
  description = "Should the traffic for the content share be routed over virtual network? Defaults to false."
  type        = bool
  default     = false
}

variable "vnet_image_pull_enabled" {
  description = "Should the traffic for image pull be routed over virtual network? Defaults to false."
  type        = bool
  default     = false
}

variable "vnet_route_all_traffic" {
  description = "Should all outbound traffic be routed over virtual network? Maps to outboundVnetRouting.allTraffic. Defaults to false."
  type        = bool
  default     = false
}

variable "workload_profile_name" {
  description = "(Optional) The workload profile name for apps hosted in a Container Apps environment."
  type        = string
  default     = null
}

variable "zip_deploy_file" {
  description = "The path to the zip file to deploy to the App Service."
  type        = string
  default     = null
}

variable "zip_deploy_wait_duration" {
  description = "The duration to wait after applying app settings and connection strings before triggering zip deploy. This allows the SCM site to pick up settings like SCM_DO_BUILD_DURING_DEPLOYMENT before the deploy starts."
  type        = string
  default     = "60s"
}
