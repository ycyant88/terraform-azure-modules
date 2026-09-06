variable "custom_domain_certificate_password" {
  description = "Certificate password for custom domain."
  type        = string
  default     = null
}

variable "custom_domain_dns_suffix" {
  description = "DNS suffix for custom domain."
  type        = string
  default     = null
}

variable "dapr_application_insights_connection_string" {
  description = "Application Insights connection string used by Dapr to export Service to Service communication telemetry."
  type        = string
  default     = null
}

variable "dapr_components" {
  description = " - component_type - (Required) The Dapr Component Type. For example state.azure.blobstorage. Changing this forces a new resource to be created.\n - ignore_errors - (Optional) Should the Dapr sidecar to continue initialisation if the component fails to load. Defaults to false\n - init_timeout - (Optional) The timeout for component initialisation as a ISO8601 formatted string. e.g. 5s, 2h, 1m. Defaults to 5s.\n - secret_store_component - (Optional) Name of a Dapr component to retrieve component secrets from.\n - scopes - (Optional) A list of scopes to which this component applies.\n - version - (Required) The version of the component.\n\n ---\n metadata block supports the following:\n - name - (Required) The name of the Metadata configuration item.\n - secret_name - (Optional) The name of a secret specified in the secrets block that contains the value for this metadata configuration item.\n - value - (Optional) The value for this metadata configuration item.\n\n ---\n secret block supports the following:\n - name - (Required) The Secret name.\n - value - (Required) The value for this secret.\n\n ---\n timeouts block supports the following:\n - create - (Defaults to 30 minutes) Used when creating the Container App Environment Dapr Component.\n - delete - (Defaults to 30 minutes) Used when deleting the Container App Environment Dapr Component.\n - read - (Defaults to 5 minutes) Used when retrieving the Container App Environment Dapr Component.\n - update - (Defaults to 30 minutes) Used when updating the Container App Environment Dapr Component.\n"
  type = map(object({
    component_type         = string
    ignore_errors          = optional(bool, true)
    init_timeout           = optional(string)
    secret_store_component = optional(string)
    scopes                 = optional(list(string))
    version                = string
    metadata = optional(list(object({
      name        = string
      secret_name = optional(string)
      value       = optional(string)
    })))
    secret = optional(set(object({
      name  = string
      value = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
    }))
  }))
  default = {}
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

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "infrastructure_resource_group_name" {
  description = "Name of the platform-managed resource group created for the Managed Environment to host infrastructure resources.\nIf a subnet ID is provided, this resource group will be created in the same subscription as the subnet.\nIf not specified, then one will be generated automatically, in the form ME_<app_managed_environment_name>_<resource_group>_<location>.\n"
  type        = string
  default     = null
}

variable "infrastructure_subnet_id" {
  description = "The existing Subnet to use for the Container Apps Control Plane. **NOTE:** The Subnet must have a /21 or larger address space."
  type        = string
  default     = null
}

variable "internal_load_balancer_enabled" {
  description = "Should the Container Environment operate in Internal Load Balancing Mode? Defaults to false. **Note:** can only be set to true if infrastructure_subnet_id is specified."
  type        = bool
  default     = false
}

variable "location" {
  description = "Azure region where the resource should be deployed."
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

variable "log_analytics_workspace" {
  description = "  The resource ID of the Log Analytics Workspace to link this Container Apps Managed Environment to.\n\n  This is the suggested mechanism to link a Log Analytics Workspace to a Container Apps Managed Environment, as it\n  avoids having to pass the primary shared key directly.\n\n  This requires at least Microsoft.OperationalInsights/workspaces/sharedkeys/read over the Log Analytics Workspace resource,\n  as the key is fetched by the module (i.e. this mirrors the behaviour of the AzureRM provider).\n\n  An alternative mechanism is to supply log_analytics_workspace_primary_shared_key directly.\n\n"
  type = object({
    resource_id = string
  })
  default = null
}

variable "log_analytics_workspace_customer_id" {
  description = "  The Customer ID for the Log Analytics Workspace to link this Container Apps Managed Environment to.\n  If specifying this, you must also specify log_analytics_workspace_primary_shared_key.\n\n  This scenario is useful where you do not have permissions to directly look up the shared key.\n\n  The preferred mechanism is to specify the log_analytics_workspace.resource_id, in which case this variable can be left as null.\n"
  type        = string
  default     = null
}

variable "log_analytics_workspace_destination" {
  description = "Destination for Log Analytics (options: 'log-analytics', 'azure-monitor', 'none')."
  type        = string
  default     = "log-analytics"
}

variable "log_analytics_workspace_primary_shared_key" {
  description = "  Optional direct mechanism to supply the primary shared key for Log Analytics.\n\n  The alternative method is to use the log_analytics_workspace.resource_id, and the module will make a POST request to\n  fetch the key, in which case this variable can be left as null.\n"
  type        = string
  default     = null
}

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
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

variable "peer_authentication_enabled" {
  description = "Enable peer authentication (Mutual TLS)."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which the Container App Environment is to be created. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on the container app environment. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "storages" {
  description = " - access_key - (Required) The Storage Account Access Key.\n - access_mode - (Required) The access mode to connect this storage to the Container App. Possible values include ReadOnly and ReadWrite. Changing this forces a new resource to be created.\n - account_name - (Required) The Azure Storage Account in which the Share to be used is located. Changing this forces a new resource to be created.\n - share_name - (Required) The name of the Azure Storage Share to use. Changing this forces a new resource to be created.\n\n ---\n timeouts block supports the following:\n - create - (Defaults to 30 minutes) Used when creating the Container App Environment Storage.\n - delete - (Defaults to 30 minutes) Used when deleting the Container App Environment Storage.\n - read - (Defaults to 5 minutes) Used when retrieving the Container App Environment Storage.\n - update - (Defaults to 30 minutes) Used when updating the Container App Environment Storage.\n\n"
  type = map(object({
    access_key   = string
    access_mode  = string
    account_name = string
    share_name   = string
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
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
  description = " - create - (Defaults to 30 minutes) Used when creating the Container App Environment.\n - delete - (Defaults to 30 minutes) Used when deleting the Container App Environment.\n - read - (Defaults to 5 minutes) Used when retrieving the Container App Environment.\n - update - (Defaults to 30 minutes) Used when updating the Container App Environment.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "workload_profile" {
  description = "\nThis lists the workload profiles that will be configured for the Managed Environment.\nThis is in addition to the default Consumption Plan workload profile.\n\n - maximum_count - (Optional) The maximum number of instances of workload profile that can be deployed in the Container App Environment.  Required for Dedicated profile types.\n - minimum_count - (Optional) The minimum number of instances of workload profile that can be deployed in the Container App Environment.  Required for Dedicated profile types.\n - name - (Required) The name of the workload profile.\n - workload_profile_type - (Required) Workload profile type for the workloads to run on. Possible values include D4, D8, D16, D32, E4, E8, E16 and E32.\n\nExamples:\n\nhcl\n  # this creates a Consumption workload profile:\n  workload_profile = [{\n    name                  = \"Consumption\"\n    workload_profile_type = \"Consumption\"\n  }]\n\n  # this creates a Dedicated workload profile, in this scenario a consumption profile is automatically created by the Container Apps service (or can be specified).\n  workload_profile = [{\n    name                  = \"Dedicated\"\n    workload_profile_type = \"D4\"\n    maximum_count         = 3\n    minimum_count         = 1\n  }]\n\n  # workload profiles can also be not specified, in which case a Consumption Only plan is created, without workload profiles.\n\n\n"
  type = set(object({
    maximum_count         = optional(number)
    minimum_count         = optional(number)
    name                  = string
    workload_profile_type = string
  }))
  default = []
}

variable "zone_redundancy_enabled" {
  description = "(Optional) Should the Container App Environment be created with Zone Redundancy enabled? Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}
