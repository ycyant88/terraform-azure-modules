variable "app_insights_configuration" {
  description = "THIS IS A VARIABLE USED FOR A PREVIEW SERVICE/FEATURE, MICROSOFT MAY NOT PROVIDE SUPPORT FOR THIS, PLEASE CHECK THE PRODUCT DOCS FOR CLARIFICATION\n\nEnvironment level Application Insights configuration. Supply the connection string via the ephemeral connection_string variable.\n\n- connection_string - Application Insights connection string (informational only; supply the value via the ephemeral connection_string variable).\n\n"
  type = object({
    connection_string = optional(string)
  })
  default = null
}

variable "app_logs_configuration" {
  description = "Cluster configuration which enables the log daemon to export app logs to configured destination.\n\n- destination - Logs destination, can be 'log-analytics' or 'azure-monitor'. Omit app_logs_configuration entirely to disable app logs.\n- log_analytics_configuration - Log Analytics configuration, must only be provided when destination is configured as 'log-analytics'\n  - customer_id - Log analytics customer id\n\n"
  type = object({
    destination = optional(string)
    log_analytics_configuration = optional(object({
      customer_id          = optional(string)
      dynamic_json_columns = optional(bool)
    }))
  })
  default = null
}

variable "availability_zones" {
  description = "THIS IS A VARIABLE USED FOR A PREVIEW SERVICE/FEATURE, MICROSOFT MAY NOT PROVIDE SUPPORT FOR THIS, PLEASE CHECK THE PRODUCT DOCS FOR CLARIFICATION\n\nThe list of availability zones to use for the managed environment.\n"
  type        = list(string)
  default     = null
}

variable "certificate_password" {
  description = "Certificate password for custom domain. Ephemeral \u2014 not stored in state."
  type        = string
  default     = null
}

variable "certificate_password_version" {
  description = "Version tracker for certificate_password. Must be set when certificate_password is provided."
  type        = number
  default     = null
}

variable "certificate_value" {
  description = "PFX or PEM blob for the custom domain certificate. Ephemeral \u2014 not stored in state. Use certificate_value_version to track changes. Takes precedence over custom_domain_configuration.certificate_value."
  type        = string
  default     = null
}

variable "certificate_value_version" {
  description = "Version tracker for certificate_value. Must be set when certificate_value is provided."
  type        = number
  default     = null
}

variable "certificates" {
  description = "A map of certificates to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\nEach certificate supports the following:\n\n- name - (Required) The name of the certificate resource.\n- location - (Required) The location for the certificate resource.\n- tags - (Optional) Tags to apply to the certificate resource.\n- password - (Optional) The certificate password.\n- password_version - (Optional) Version tracker for password. Must be set when password is provided.\n- value - (Optional) The PFX or PEM certificate blob.\n- value_version - (Optional) Version tracker for value. Must be set when value is provided.\n\ncertificate_key_vault_properties supports the following:\n\n- identity - (Optional) Resource ID of a managed identity to authenticate with Azure Key Vault, or System to use a system-assigned identity.\n- key_vault_url - (Optional) URL pointing to the Azure Key Vault secret that holds the certificate.\n"
  type = map(object({
    certificate_key_vault_properties = optional(object({
      identity      = optional(string)
      key_vault_url = optional(string)
    }))
    location         = string
    name             = string
    password         = optional(string)
    password_version = optional(number)
    tags             = optional(map(string))
    value            = optional(any)
    value_version    = optional(number)
  }))
  default = {}
}

variable "connection_string" {
  description = "Application Insights connection string for app_insights_configuration. Ephemeral \u2014 not stored in state. Use connection_string_version to track changes."
  type        = string
  default     = null
}

variable "connection_string_version" {
  description = "Version tracker for connection_string. Must be set when connection_string is provided."
  type        = number
  default     = null
}

variable "custom_domain_certificate_key_vault_identity" {
  description = "DEPRECATED: Use custom_domain_configuration.certificate_key_vault_properties.identity instead. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "custom_domain_certificate_key_vault_url" {
  description = "DEPRECATED: Use custom_domain_configuration.certificate_key_vault_properties.key_vault_url instead. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "custom_domain_certificate_password" {
  description = "DEPRECATED: Use certificate_password (ephemeral) + certificate_password_version instead. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "custom_domain_certificate_value" {
  description = "DEPRECATED: Use custom_domain_configuration.certificate_value instead. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "custom_domain_configuration" {
  description = "Custom domain configuration for the environment.\n\n- certificate_key_vault_properties - Certificate stored in Azure Key Vault.\n  - identity - Resource ID of a managed identity to authenticate with Azure Key Vault, or System to use a system-assigned identity.\n  - key_vault_url - URL pointing to the Azure Key Vault secret that holds the certificate.\n- certificate_value - PFX or PEM blob\n- dns_suffix - DNS suffix for the environment domain\n\n"
  type = object({
    certificate_key_vault_properties = optional(object({
      identity      = optional(string)
      key_vault_url = optional(string)
    }))
    certificate_value = optional(any)
    dns_suffix        = optional(string)
  })
  default = null
}

variable "custom_domain_dns_suffix" {
  description = "DEPRECATED: Use custom_domain_configuration = { dns_suffix = \"...\" } instead. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "dapr_ai_connection_string" {
  description = "Application Insights connection string used by Dapr to export Service to Service communication telemetry. Ephemeral \u2014 not stored in state."
  type        = string
  default     = null
}

variable "dapr_ai_connection_string_version" {
  description = "Version tracker for dapr_ai_connection_string. Must be set when dapr_ai_connection_string is provided."
  type        = number
  default     = null
}

variable "dapr_ai_instrumentation_key" {
  description = "Azure Monitor instrumentation key used by Dapr to export Service to Service communication telemetry. Ephemeral \u2014 not stored in state."
  type        = string
  default     = null
}

variable "dapr_ai_instrumentation_key_version" {
  description = "Version tracker for dapr_ai_instrumentation_key. Must be set when dapr_ai_instrumentation_key is provided."
  type        = number
  default     = null
}

variable "dapr_application_insights_connection_string" {
  description = "DEPRECATED: Use dapr_ai_connection_string (ephemeral) + dapr_ai_connection_string_version instead. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "dapr_components" {
  description = "Map of Dapr components to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\nEach Dapr component supports the following:\n\n- name - (Required) The name of the Dapr component resource.\n- component_type - (Optional) The Dapr component type.\n- dapr_components_version - (Optional) The component version.\n- ignore_errors - (Optional) Whether component loading errors should be ignored.\n- init_timeout - (Optional) The initialization timeout.\n- scopes - (Optional) Names of container apps that can use this Dapr component.\n- secret_store_component - (Optional) The name of a Dapr component to retrieve component secrets from.\n- secrets_version - (Optional) Version tracker for secrets. Must be set when secrets is provided.\n\nmetadata supports the following:\n\n- name - (Optional) The metadata item name.\n- secret_ref - (Optional) A secret reference for the metadata item.\n- value - (Optional) The metadata item value.\n\nsecrets supports the following:\n\n- identity - (Optional) The managed identity used for Key Vault access.\n- key_vault_url - (Optional) The Key Vault secret URL for the secret value.\n- name - (Optional) The secret name.\n- value - (Optional) The secret value.\n"
  type = map(object({
    component_type          = optional(string)
    dapr_components_version = optional(string)
    ignore_errors           = optional(bool)
    init_timeout            = optional(string)
    metadata = optional(list(object({
      name       = optional(string)
      secret_ref = optional(string)
      value      = optional(string)
    })))
    name                   = string
    scopes                 = optional(list(string))
    secret_store_component = optional(string)
    secrets = optional(list(object({
      identity      = optional(string)
      key_vault_url = optional(string)
      name          = optional(string)
      value         = optional(string)
    })))
    secrets_version = optional(number)
  }))
  default = {}
}

variable "dapr_configuration" {
  description = "The configuration of Dapr component."
  type        = object({})
  default     = null
}

variable "dapr_subscriptions" {
  description = "Map of Dapr subscriptions to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\nEach Dapr subscription supports the following:\n\n- name - (Required) The name of the Dapr subscription resource.\n- dead_letter_topic - (Optional) The dead-letter topic name.\n- metadata - (Optional) Metadata for the subscription.\n- pubsub_name - (Optional) The Dapr PubSub component name.\n- scopes - (Optional) Application scopes to restrict the subscription to specific apps.\n- topic - (Optional) The topic name.\n\nbulk_subscribe supports the following:\n\n- enabled - (Optional) Whether bulk subscription delivery is enabled.\n- max_await_duration_ms - (Optional) The maximum duration in milliseconds to wait before a bulk message is sent to the app.\n- max_messages_count - (Optional) The maximum number of messages to deliver in a bulk message.\n\nroutes supports the following:\n\n- default - (Optional) The default path to deliver events that do not match any route rules.\n- rules - (Optional) The list of Dapr PubSub event subscription route rules.\n"
  type = map(object({
    bulk_subscribe = optional(object({
      enabled               = optional(bool)
      max_await_duration_ms = optional(number)
      max_messages_count    = optional(number)
    }))
    dead_letter_topic = optional(string)
    metadata          = optional(map(string))
    name              = string
    pubsub_name       = optional(string)
    routes = optional(object({
      default = optional(string)
      rules = optional(list(object({
        match = optional(string)
        path  = optional(string)
      })))
    }))
    scopes = optional(list(string))
    topic  = optional(string)
  }))
  default = {}
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs.\n"
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

variable "disk_encryption_configuration" {
  description = "THIS IS A VARIABLE USED FOR A PREVIEW SERVICE/FEATURE, MICROSOFT MAY NOT PROVIDE SUPPORT FOR THIS, PLEASE CHECK THE PRODUCT DOCS FOR CLARIFICATION\n\nDisk encryption configuration for the Managed Environment.\n\n- key_vault_configuration - Key Vault configuration for disk encryption.\n  - auth - Authentication configuration.\n    - identity - Resource ID of a user-assigned managed identity, or System to use the system-assigned identity.\n  - key_url - Key URL (including version) pointing to a key in Key Vault.\n\n"
  type = object({
    key_vault_configuration = optional(object({
      auth = optional(object({
        identity = optional(string)
      }))
      key_url = optional(string)
    }))
  })
  default = null
}

variable "dot_net_components" {
  description = "Map of .NET components to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\nEach .NET component supports the following:\n\n- name - (Required) The name of the .NET component resource.\n- component_type - (Optional) The .NET component type.\n- configurations - (Optional) Configuration properties for the .NET component.\n- service_binds - (Optional) Service bindings for the .NET component.\n"
  type = map(object({
    component_type = optional(any)
    configurations = optional(list(object({
      property_name = optional(string)
      value         = optional(string)
    })))
    name = string
    service_binds = optional(list(object({
      name       = optional(string)
      service_id = optional(string)
    })))
  }))
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "http_route_configs" {
  description = "Map of HTTP route configurations to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\nEach HTTP route configuration supports the following:\n\n- name - (Required) The name of the HTTP route configuration resource.\n- custom_domains - (Optional) Custom domain bindings for the HTTP route hostnames.\n- rules - (Optional) Routing rules for the HTTP route configuration.\n"
  type = map(object({
    custom_domains = optional(list(object({
      binding_type   = optional(any)
      certificate_id = optional(string)
      name           = string
    })))
    name = string
    rules = optional(list(object({
      description = optional(string)
      routes = optional(list(object({
        action = optional(object({
          prefix_rewrite = optional(string)
        }))
        match = optional(object({
          case_sensitive        = optional(bool)
          path                  = optional(string)
          path_separated_prefix = optional(string)
          prefix                = optional(string)
        }))
      })))
      targets = optional(list(object({
        container_app = string
        label         = optional(string)
        revision      = optional(string)
      })))
    })))
  }))
  default = {}
}

variable "ignore_body_changes" {
  description = "Paths in each resource's body whose changes the AzAPI provider ignores. Prefer Terraform's lifecycle.ignore_changes when the paths are static; use this variable when the paths must be derived from variables or other non-static values.\n\nPaths use dot notation, for example properties.sku.name. Individual list items cannot be targeted \u2014 ignore the whole list property instead. Configuration changes at an ignored path are **not** sent to Azure until that path is removed from the list.\n\nSupplying a non-empty value requires Terraform 1.11 or later, because ignore_body_changes is a write-only argument. Changes take effect only after an apply, because the value is held in provider-private state.\n\n- app_managed_environments - Ignored body paths for the Container Apps Managed Environment.\n- authorization_locks - Ignored body paths for the management lock.\n- authorization_role_assignments - Ignored body paths for the role assignments.\n- insights_diagnostic_settings - Ignored body paths for the diagnostic settings.\n- app_managed_environments_certificates - Override slot for the certificates submodule. Supply only the keys you want to override.\n  - app_managed_environments_certificates - Ignored body paths for the certificates.\n- app_managed_environments_dapr_components - Override slot for the dapr_components submodule.\n  - app_managed_environments_dapr_components - Ignored body paths for the Dapr components.\n- app_managed_environments_dapr_subscriptions - Override slot for the dapr_subscriptions submodule.\n  - app_managed_environments_dapr_subscriptions - Ignored body paths for the Dapr subscriptions.\n- app_managed_environments_dot_net_components - Override slot for the dot_net_components submodule.\n  - app_managed_environments_dot_net_components - Ignored body paths for the .NET components.\n- app_managed_environments_http_route_configs - Override slot for the http_route_configs submodule.\n  - app_managed_environments_http_route_configs - Ignored body paths for the HTTP route configurations.\n- app_managed_environments_java_components - Override slot for the java_components submodule.\n  - app_managed_environments_java_components - Ignored body paths for the Java components.\n- app_managed_environments_maintenance_configurations - Override slot for the maintenance_configurations submodule.\n  - app_managed_environments_maintenance_configurations - Ignored body paths for the maintenance configurations.\n- app_managed_environments_managed_certificates - Override slot for the managed_certificates submodule.\n  - app_managed_environments_managed_certificates - Ignored body paths for the managed certificates.\n- app_managed_environments_storages - Override slot for the storages submodule.\n  - app_managed_environments_storages - Ignored body paths for the storages.\n"
  type = object({
    app_managed_environments       = optional(list(string), [])
    authorization_locks            = optional(list(string), [])
    authorization_role_assignments = optional(list(string), [])
    insights_diagnostic_settings   = optional(list(string), [])

    app_managed_environments_certificates = optional(object({
      app_managed_environments_certificates = optional(list(string), [])
    }), {})
    app_managed_environments_dapr_components = optional(object({
      app_managed_environments_dapr_components = optional(list(string), [])
    }), {})
    app_managed_environments_dapr_subscriptions = optional(object({
      app_managed_environments_dapr_subscriptions = optional(list(string), [])
    }), {})
    app_managed_environments_dot_net_components = optional(object({
      app_managed_environments_dot_net_components = optional(list(string), [])
    }), {})
    app_managed_environments_http_route_configs = optional(object({
      app_managed_environments_http_route_configs = optional(list(string), [])
    }), {})
    app_managed_environments_java_components = optional(object({
      app_managed_environments_java_components = optional(list(string), [])
    }), {})
    app_managed_environments_maintenance_configurations = optional(object({
      app_managed_environments_maintenance_configurations = optional(list(string), [])
    }), {})
    app_managed_environments_managed_certificates = optional(object({
      app_managed_environments_managed_certificates = optional(list(string), [])
    }), {})
    app_managed_environments_storages = optional(object({
      app_managed_environments_storages = optional(list(string), [])
    }), {})
  })
  default = {}
}

variable "infrastructure_resource_group" {
  description = "Name of the platform-managed resource group created for the Managed Environment to host infrastructure resources.\nIf a subnet ID is provided, this resource group will be created in the same subscription as the subnet.\nIf not specified, then one will be generated automatically, in the form ME_<app_managed_environment_name>_<resource_group>_<location>.\n"
  type        = string
  default     = null
}

variable "infrastructure_resource_group_name" {
  description = "DEPRECATED: Renamed to infrastructure_resource_group. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "infrastructure_subnet_id" {
  description = "DEPRECATED: Use vnet_configuration = { infrastructure_subnet_id = \"...\" } instead. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "ingress_configuration" {
  description = "Ingress configuration for the Managed Environment.\n\n- header_count_limit - Maximum number of headers per request allowed by the ingress. Must be at least 1. Defaults to 100.\n- request_idle_timeout - Duration (in minutes) before idle requests are timed out. Must be between 4 and 30 inclusive. Defaults to 4 minutes.\n- termination_grace_period_seconds - Time (in seconds) to allow active connections to complete on termination. Must be between 0 and 3600. Defaults to 480 seconds.\n- workload_profile_name - Name of the workload profile used by the ingress component.\n\n"
  type = object({
    header_count_limit               = optional(number)
    request_idle_timeout             = optional(number)
    termination_grace_period_seconds = optional(number)
    workload_profile_name            = optional(string)
  })
  default = null
}

variable "internal_load_balancer_enabled" {
  description = "DEPRECATED: Use vnet_configuration = { internal = true } instead. Will be removed in a future major release."
  type        = bool
  default     = null
}

variable "java_components" {
  description = "Map of Java components to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\nEach Java component supports the following:\n\n- name - (Required) The name of the Java component resource.\n- component_type - (Required) The Java component type.\n- configurations - (Optional) Configuration properties for the Java component.\n- ingress - (Optional) Ingress configuration for the Java component.\n- service_binds - (Optional) Service bindings for the Java component.\n\nscale supports the following:\n\n- max_replicas - (Optional) The maximum number of Java component replicas.\n- min_replicas - (Optional) The minimum number of Java component replicas.\n"
  type = map(object({
    component_type = string
    configurations = optional(list(object({
      property_name = optional(string)
      value         = optional(string)
    })))
    ingress = optional(object({}))
    name    = string
    scale = optional(object({
      max_replicas = optional(number)
      min_replicas = optional(number)
    }))
    service_binds = optional(list(object({
      name       = optional(string)
      service_id = optional(string)
    })))
  }))
  default = {}
}

variable "keda_configuration" {
  description = "The configuration of Keda component."
  type        = object({})
  default     = null
}

variable "key" {
  description = "DataDog API key for open_telemetry_configuration.destinations_configuration.data_dog_configuration. Ephemeral \u2014 not stored in state. Use key_version to track changes."
  type        = string
  default     = null
}

variable "key_version" {
  description = "Version tracker for key. Must be set when key is provided."
  type        = number
  default     = null
}

variable "kind" {
  description = "Kind of the Managed Environment."
  type        = string
  default     = null
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n- notes - (Optional) Notes about the lock. This value maps to Microsoft.Authorization/locks.properties.notes. If not specified, a note describing the lock kind is used.\n\nA ReadOnly lock also blocks changes to the environment's child resources, such as Dapr components and storages, and to its role assignments and diagnostic settings.\n"
  type = object({
    kind  = string
    name  = optional(string, null)
    notes = optional(string, null)
  })
  default = null
}

variable "log_analytics_workspace" {
  description = "The resource ID of the Log Analytics Workspace to link this Container Apps Managed Environment to.\n\nThis is the suggested mechanism to link a Log Analytics Workspace to a Container Apps Managed Environment, as it\navoids having to pass the primary shared key directly.\n\nThis requires at least Microsoft.OperationalInsights/workspaces/sharedkeys/read over the Log Analytics Workspace resource,\nas the key is fetched by the module (i.e. this mirrors the behaviour of the AzureRM provider).\n\nAn alternative mechanism is to supply shared_key directly.\n\n"
  type = object({
    resource_id = string
  })
  default = null
}

variable "log_analytics_workspace_customer_id" {
  description = "DEPRECATED: Use app_logs_configuration.log_analytics_configuration.customer_id, or set log_analytics_workspace.resource_id to auto-fetch. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "log_analytics_workspace_destination" {
  description = "DEPRECATED: Use app_logs_configuration.destination instead. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "log_analytics_workspace_primary_shared_key" {
  description = "DEPRECATED: Use shared_key (ephemeral) + shared_key_version instead. Will be removed in a future major release."
  type        = string
  default     = null
}

variable "maintenance_configurations" {
  description = "Map of maintenance configurations to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\nEach maintenance configuration supports the following:\n\n- name - (Required) The name of the maintenance configuration resource.\n- scheduled_entries - (Required) The list of maintenance schedules for the managed environment.\n"
  type = map(object({
    name = string
    scheduled_entries = list(object({
      duration_hours = number
      start_hour_utc = number
      week_day       = string
    }))
  }))
  default = {}
}

variable "managed_certificates" {
  description = "Map of managed certificates to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\nEach managed certificate supports the following:\n\n- name - (Required) The name of the managed certificate resource.\n- location - (Required) The location for the managed certificate resource.\n- subject_name - (Optional) The subject name for the certificate.\n- domain_control_validation - (Optional) The selected domain control validation method.\n- tags - (Optional) Tags to apply to the managed certificate resource.\n"
  type = map(object({
    domain_control_validation = optional(any)
    location                  = string
    name                      = string
    subject_name              = optional(string)
    tags                      = optional(map(string))
  }))
  default = {}
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
  description = "The name of the Container Apps Managed Environment."
  type        = string
  default     = ""
}

variable "open_telemetry_configuration" {
  description = "THIS IS A VARIABLE USED FOR A PREVIEW SERVICE/FEATURE, MICROSOFT MAY NOT PROVIDE SUPPORT FOR THIS, PLEASE CHECK THE PRODUCT DOCS FOR CLARIFICATION\n\nEnvironment Open Telemetry configuration.\n\n- destinations_configuration - Open telemetry destinations configuration.\n  - data_dog_configuration - Datadog destination configuration.\n    - key - DataDog API key (informational only; supply the value via the ephemeral key variable).\n    - site - The DataDog site.\n  - otlp_configurations - OTLP endpoint configurations.\n    - endpoint - OTLP endpoint URL.\n    - headers - HTTP headers for OTLP requests.\n    - insecure - Whether the connection is insecure.\n    - name - Name of the OTLP configuration.\n- logs_configuration - Open telemetry logs configuration.\n  - destinations - List of log destination names.\n- metrics_configuration - Open telemetry metrics configuration.\n  - destinations - List of metrics destination names.\n  - include_keda - Include KEDA metrics.\n- traces_configuration - Open telemetry traces configuration.\n  - destinations - List of traces destination names.\n  - include_dapr - Include Dapr traces.\n\n"
  type = object({
    destinations_configuration = optional(object({
      data_dog_configuration = optional(object({
        key  = optional(string)
        site = optional(string)
      }))
      otlp_configurations = optional(list(object({
        endpoint = optional(string)
        headers = optional(list(object({
          key   = optional(string)
          value = optional(string)
        })))
        insecure = optional(bool)
        name     = optional(string)
      })))
    }))
    logs_configuration = optional(object({
      destinations = optional(list(string))
    }))
    metrics_configuration = optional(object({
      destinations = optional(list(string))
      include_keda = optional(bool)
    }))
    traces_configuration = optional(object({
      destinations = optional(list(string))
      include_dapr = optional(bool)
    }))
  })
  default = null
}

variable "parent_id" {
  description = "The resource ID of the resource group in which to create the Container Apps Managed Environment, for example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg. When provided, takes precedence over resource_group_name. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "peer_authentication" {
  description = "Peer authentication settings for the Managed Environment.\n\n- mtls - Mutual TLS authentication settings for the Managed Environment\n  - enabled - Boolean indicating whether the mutual TLS authentication is enabled\n\n"
  type = object({
    mtls = optional(object({
      enabled = optional(bool)
    }))
  })
  default = null
}

variable "peer_authentication_enabled" {
  description = "DEPRECATED: Use peer_authentication = { mtls = { enabled = true } } instead. Will be removed in a future major release."
  type        = bool
  default     = null
}

variable "peer_traffic_configuration" {
  description = "Peer traffic settings for the Managed Environment.\n\n- encryption - Peer traffic encryption settings for the Managed Environment\n  - enabled - Boolean indicating whether the peer traffic encryption is enabled\n\n"
  type = object({
    encryption = optional(object({
      enabled = optional(bool)
    }))
  })
  default = null
}

variable "peer_traffic_encryption_enabled" {
  description = "DEPRECATED: Use peer_traffic_configuration = { encryption = { enabled = true } } instead. Will be removed in a future major release."
  type        = bool
  default     = null
}

variable "public_network_access" {
  description = "Property to allow or block all public traffic. Allowed values: 'Enabled', 'Disabled'.\n\n**Note:** If vnet_configuration.internal is true, this module forces 'Disabled' regardless of this setting.\n\n"
  type        = any
  default     = null
}

variable "public_network_access_enabled" {
  description = "DEPRECATED: Use public_network_access (string: \"Enabled\" or \"Disabled\") instead. Will be removed in a future major release."
  type        = bool
  default     = null
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which the Container App Environment is to be created. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "Override the AzAPI <provider>/<resource>@<api-version> strings used by this module and its submodules. Each key defaults to a tested value; supply only the keys you want to override. Useful when targeting a sovereign cloud with older API versions, or when opting into a newer preview API.\n\n- app_managed_environments - The Container Apps Managed Environment.\n- authorization_locks - The management lock.\n- authorization_role_assignments - The role assignments.\n- insights_diagnostic_settings - The diagnostic settings. The default is a preview version because the stable version does not support log category groups.\n- app_managed_environments_certificates - Override slot for the certificates submodule. Defaults live in the submodule; supply only the keys you want to override.\n  - app_managed_environments_certificates - The certificate resource managed by the certificates submodule.\n- app_managed_environments_dapr_components - Override slot for the dapr_components submodule. Defaults live in the submodule.\n  - app_managed_environments_dapr_components - The Dapr component resource managed by the dapr_components submodule.\n- app_managed_environments_dapr_subscriptions - Override slot for the dapr_subscriptions submodule. Defaults live in the submodule.\n  - app_managed_environments_dapr_subscriptions - The Dapr subscription resource managed by the dapr_subscriptions submodule.\n- app_managed_environments_dot_net_components - Override slot for the dot_net_components submodule. Defaults live in the submodule.\n  - app_managed_environments_dot_net_components - The .NET component resource managed by the dot_net_components submodule.\n- app_managed_environments_http_route_configs - Override slot for the http_route_configs submodule. Defaults live in the submodule.\n  - app_managed_environments_http_route_configs - The HTTP route configuration resource managed by the http_route_configs submodule.\n- app_managed_environments_java_components - Override slot for the java_components submodule. Defaults live in the submodule.\n  - app_managed_environments_java_components - The Java component resource managed by the java_components submodule.\n- app_managed_environments_maintenance_configurations - Override slot for the maintenance_configurations submodule. Defaults live in the submodule.\n  - app_managed_environments_maintenance_configurations - The maintenance configuration resource managed by the maintenance_configurations submodule.\n- app_managed_environments_managed_certificates - Override slot for the managed_certificates submodule. Defaults live in the submodule.\n  - app_managed_environments_managed_certificates - The managed certificate resource managed by the managed_certificates submodule.\n- app_managed_environments_storages - Override slot for the storages submodule. Defaults live in the submodule.\n  - app_managed_environments_storages - The storage resource managed by the storages submodule.\n"
  type = object({
    app_managed_environments       = optional(string, "Microsoft.App/managedEnvironments@2025-10-02-preview")
    authorization_locks            = optional(string, "Microsoft.Authorization/locks@2020-05-01")
    authorization_role_assignments = optional(string, "Microsoft.Authorization/roleAssignments@2022-04-01")
    insights_diagnostic_settings   = optional(string, "Microsoft.Insights/diagnosticSettings@2021-05-01-preview")

    app_managed_environments_certificates = optional(object({
      app_managed_environments_certificates = optional(string)
    }), {})
    app_managed_environments_dapr_components = optional(object({
      app_managed_environments_dapr_components = optional(string)
    }), {})
    app_managed_environments_dapr_subscriptions = optional(object({
      app_managed_environments_dapr_subscriptions = optional(string)
    }), {})
    app_managed_environments_dot_net_components = optional(object({
      app_managed_environments_dot_net_components = optional(string)
    }), {})
    app_managed_environments_http_route_configs = optional(object({
      app_managed_environments_http_route_configs = optional(string)
    }), {})
    app_managed_environments_java_components = optional(object({
      app_managed_environments_java_components = optional(string)
    }), {})
    app_managed_environments_maintenance_configurations = optional(object({
      app_managed_environments_maintenance_configurations = optional(string)
    }), {})
    app_managed_environments_managed_certificates = optional(object({
      app_managed_environments_managed_certificates = optional(string)
    }), {})
    app_managed_environments_storages = optional(object({
      app_managed_environments_storages = optional(string)
    }), {})
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to every azapi resource managed by the module (root resource and all submodules). By default the module retries ContainerAppEnvironmentDisabled, which the control plane returns until an environment that has scaled to zero finishes waking. Consumers **MAY** override any field.\n\n- error_message_regex  - (Optional) A list of regex patterns matching error messages that trigger a retry. Defaults to [\"ContainerAppEnvironmentDisabled\"].\n- interval_seconds     - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n\nSee <https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource#retry> for full semantics.\n"
  type = object({
    error_message_regex  = optional(list(string), ["ContainerAppEnvironmentDisabled"])
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = {}
}

variable "role_assignments" {
  description = "A map of role assignments to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the role assignment. If not set, a random UUID will be generated. Changing this forces the creation of a new resource. Role assignments created by earlier versions of this module keep their existing name.\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal. A name is matched, ignoring case, against the role definitions that can be assigned in the resource group. For a custom role that can only be assigned on this Container Apps Managed Environment, use its ID.\n- principal_id - The ID of the principal to assign the role to.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) If set to true and principal_type is not set, principal_type is set to ServicePrincipal, which skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    name                                   = optional(string, null)
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

variable "shared_key" {
  description = "Log analytics primary shared key. Ephemeral \u2014 not stored in state.\n\nThe preferred mechanism is to specify log_analytics_workspace.resource_id, in which case this can be left as null.\n\n"
  type        = string
  default     = null
}

variable "shared_key_version" {
  description = "Version tracker for shared_key. Must be set when shared_key is provided."
  type        = number
  default     = null
}

variable "storages" {
  description = "Map of storage definitions to create on the Container Apps Managed Environment. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\nEach storage definition supports the following:\n\n- name - (Required) The name of the storage resource.\n- account_key - (Optional) The storage account key for the Azure file share.\n- account_key_version - (Optional) Version tracker for account_key. Must be set when account_key is provided.\n\nazure_file supports the following:\n\n- access_mode - (Optional) The access mode for the Azure file share.\n- account_key - (Optional) The storage account key for the Azure file share.\n- account_name - (Optional) The storage account name.\n- share_name - (Optional) The Azure file share name.\n\nazure_file.account_key_vault_properties supports the following:\n\n- identity - (Optional) Resource ID of a managed identity to authenticate with Azure Key Vault, or System to use a system-assigned identity.\n- key_vault_url - (Optional) URL pointing to the Azure Key Vault secret that holds the storage account key.\n\nnfs_azure_file supports the following:\n\n- access_mode - (Optional) The access mode for the NFS Azure file share.\n- server - (Optional) The Azure storage account server address.\n- share_name - (Optional) The NFS Azure file share name.\n"
  type = map(object({
    account_key         = optional(string)
    account_key_version = optional(number)
    azure_file = optional(object({
      access_mode = optional(any)
      account_key = optional(string)
      account_key_vault_properties = optional(object({
        identity      = optional(string)
        key_vault_url = optional(string)
      }))
      account_name = optional(string)
      share_name   = optional(string)
    }))
    name = string
    nfs_azure_file = optional(object({
      access_mode = optional(any)
      server      = optional(string)
      share_name  = optional(string)
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
  description = "Default per-operation timeouts applied to every azapi resource managed by the module (root resource and all submodules). Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n\n- create - (Optional) Timeout for create operations.\n- read   - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n- delete - (Optional) Timeout for delete operations.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "vnet_configuration" {
  description = "VNet configuration for the Managed Environment.\n\n- docker_bridge_cidr - CIDR notation IP range assigned to the Docker bridge network. Must not overlap with any other provided IP ranges.\n- infrastructure_subnet_id - Resource ID of a subnet for infrastructure components. Must not overlap with any other provided IP ranges.\n- internal - Boolean indicating the environment only has an internal load balancer. These environments do not have a public static IP resource. They must provide infrastructure_subnet_id if enabling this property.\n- platform_reserved_cidr - IP range in CIDR notation that can be reserved for environment infrastructure IP addresses. Must not overlap with any other provided IP ranges.\n- platform_reserved_dns_ip - An IP address from the IP range defined by platform_reserved_cidr that will be reserved for the internal DNS server.\n\n"
  type = object({
    docker_bridge_cidr       = optional(string)
    infrastructure_subnet_id = optional(string)
    internal                 = optional(bool)
    platform_reserved_cidr   = optional(string)
    platform_reserved_dns_ip = optional(string)
  })
  default = null
}

variable "workload_profile" {
  description = "DEPRECATED: Renamed to workload_profiles (list). Will be removed in a future major release."
  type = set(object({
    maximum_count         = optional(number)
    minimum_count         = optional(number)
    name                  = string
    workload_profile_type = string
  }))
  default = null
}

variable "workload_profiles" {
  description = "Workload profiles configured for the Managed Environment. This is in addition to the default Consumption profile.\n\n- maximum_count - (Optional) The maximum number of instances of workload profile that can be deployed in the Container App Environment. Required for Dedicated profile types.\n- minimum_count - (Optional) The minimum number of instances of workload profile that can be deployed in the Container App Environment. Required for Dedicated profile types.\n- name - (Required) The name of the workload profile.\n- workload_profile_type - (Required) Workload profile type for the workloads to run on. Current documented values are Consumption, Flex, D4, D8, D16, D32, E4, E8, E16, E32, DC4, DC8, DC16, DC32, DC48, DC64, DC96, NC24-A100, NC48-A100, NC96-A100, Consumption-GPU-NC24-A100, and Consumption-GPU-NC8as-T4.\nExamples:\n\nhcl\n  workload_profiles = [{\n    name                  = \"Dedicated\"\n    workload_profile_type = \"D4\"\n    maximum_count         = 3\n    minimum_count         = 1\n  }]\n\n\n"
  type = list(object({
    maximum_count         = optional(number)
    minimum_count         = optional(number)
    name                  = string
    workload_profile_type = string
  }))
  default = null
}

variable "zone_redundancy_enabled" {
  description = "DEPRECATED: Renamed to zone_redundant. Will be removed in a future major release."
  type        = bool
  default     = null
}

variable "zone_redundant" {
  description = "(Optional) Should the Container App Environment be created with Zone Redundancy enabled? Defaults to true. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}
