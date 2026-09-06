variable "allow_project_management" {
  description = "Specifies whether this resource support project management as child resources, used as containers for access management, data isolation and cost in AI Foundry."
  type        = bool
  default     = false
}

variable "aml_workspace" {
  description = "  Controls the AML Workspace configuration on this resource. The following properties can be specified:\n\n - resource_id - (Required) Full resource id of a Microsoft.AMLWorkspace resource.\n - identity_client_id - (Optional) The client ID of the managed identity associated with the AML Workspace resource.\n"
  type = object({
    resource_id        = string
    identity_client_id = optional(string, null)
  })
  default = null
}

variable "associated_projects" {
  description = "(Optional) Specifies the projects, by project name, that are associated with this resource."
  type        = list(string)
  default     = []
}

variable "cognitive_deployments" {
  description = "- name - (Required) The name of the Cognitive Services Account Deployment. Changing this forces a new resource to be created.\n- rai_policy_name - (Optional) The name of RAI policy.\n- version_upgrade_option - (Optional) Deployment model version upgrade option. Possible values are OnceNewDefaultVersionAvailable, OnceCurrentVersionExpired, and NoAutoUpgrade. Defaults to OnceNewDefaultVersionAvailable. Changing this forces a new resource to be created.\n- dynamic_throttling_enabled - (Optional) Whether dynamic throttling is enabled. Defaults to false.\n\n---\nmodel block supports the following:\n- format - (Required) The format of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created. Possible value is OpenAI.\n- name - (Required) The name of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created.\n- version - (Optional) The version of Cognitive Services Account Deployment model. If version is not specified, the default version of the model at the time will be assigned.\n\n---\nscale block supports the following:\n- capacity - (Optional) Tokens-per-Minute (TPM). The unit of measure for this field is in the thousands of Tokens-per-Minute. Defaults to 1 which means that the limitation is 1000 tokens per minute. If the resources SKU supports scale in/out then the capacity field should be included in the resources' configuration. If the scale in/out is not supported by the resources SKU then this field can be safely omitted. For more information about TPM please see the [product documentation](https://learn.microsoft.com/azure/ai-services/openai/how-to/quota?tabs=rest). Defaults to 1.\n- family - (Optional) If the service has different generations of hardware, for the same SKU, then that can be captured here. Changing this forces a new resource to be created.\n- size - (Optional) The SKU size. When the name field is the combination of tier and some other value, this would be the standalone code. Changing this forces a new resource to be created.\n- tier - (Optional) Possible values are Free, Basic, Standard, Premium, Enterprise. Changing this forces a new resource to be created.\n- type - (Required) The name of the SKU. Ex\n\n---\nretry block supports the following:\n- error_message_regex - (Required) A list of regular expressions to match against error messages. If any of the regular expressions match, the request will be retried.\n- interval_seconds - (Optional) The base number of seconds to wait between retries. Defaults to 30.\n- max_interval_seconds - (Optional) The maximum number of seconds to wait between retries. Defaults to 300.\n- multiplier - (Optional) The multiplier to apply to the interval between retries. Defaults to 1.5.\n- randomization_factor - (Optional) The randomization factor to apply to the interval between retries. The formula for the randomized interval is: RetryInterval * (random value in range [1 - RandomizationFactor, 1 + RandomizationFactor]). Therefore set to zero 0.0 for no randomization. Defaults to 0.3.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 30 minutes) Used when creating the Cognitive Services Account Deployment.\n- delete - (Defaults to 30 minutes) Used when deleting the Cognitive Services Account Deployment.\n- read - (Defaults to 5 minutes) Used when retrieving the Cognitive Services Account Deployment.\n- update - (Defaults to 30 minutes) Used when updating the Cognitive Services Account Deployment.\n"
  type = map(object({
    name                       = string
    rai_policy_name            = optional(string)
    version_upgrade_option     = optional(string, "OnceNewDefaultVersionAvailable")
    dynamic_throttling_enabled = optional(bool, false)
    model = object({
      format  = string
      name    = string
      version = optional(string)
    })
    scale = object({
      capacity = optional(number, 1)
      family   = optional(string)
      size     = optional(string)
      tier     = optional(string)
      type     = string
    })
    retry = optional(object({
      error_message_regex  = list(string)
      interval_seconds     = optional(number, 30)
      max_interval_seconds = optional(number, 300)
      multiplier           = optional(number, 1.5)
      randomization_factor = optional(number, 0.3)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}

variable "custom_question_answering_search_service_id" {
  description = "(Optional) If kind is TextAnalytics this specifies the ID of the Search service."
  type        = string
  default     = null
}

variable "custom_question_answering_search_service_key" {
  description = "(Optional) If kind is TextAnalytics this specifies the key of the Search service."
  type        = string
  default     = null
}

variable "custom_subdomain_name" {
  description = "(Optional) The subdomain name used for token-based authentication. This property is required when network_acls is specified. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "customer_managed_key" {
  description = "  Controls the Customer managed key configuration on this resource. The following properties can be specified:\n\n  - key_vault_resource_id - (Required) Resource ID of the Key Vault that the customer managed key belongs to.\n  - key_name - (Required) Specifies the name of the Customer Managed Key Vault Key.\n  - key_version - (Optional) The version of the Customer Managed Key Vault Key.\n  - user_assigned_identity - (Optional) The User Assigned Identity that has access to the key.\n    - resource_id - (Required) The resource ID of the User Assigned Identity that has access to the key.\n"
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

variable "default_project" {
  description = "(Optional) Specifies the project, by project name, that is targeted when data plane endpoints are called without a project parameter."
  type        = string
  default     = null
}

variable "deployment_serialization_enabled" {
  description = "(Optional) Whether to enable serialized creation of cognitive deployments to avoid operation conflicts. When enabled, all deployments will be created sequentially by locking on the parent cognitive account resource. This prevents the '409 Conflict' errors that can occur when creating multiple deployments simultaneously. Users may choose to disable this if they prefer to handle deployment conflicts through other means or if they are only creating single deployments. Defaults to false."
  type        = bool
  default     = true
}

variable "diagnostic_settings" {
  description = "  A map of diagnostic settings to create on the Cognitive Account. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n  - log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n  - metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "dynamic_throttling_enabled" {
  description = "(Optional) Whether to enable the dynamic throttling for this Cognitive Service Account."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "fqdns" {
  description = "(Optional) List of FQDNs allowed for the Cognitive Account."
  type        = list(string)
  default     = []
}

variable "is_hsm_key" {
  description = "(Optional) Describes whether the Cognitive Account is using a Hardware Security Module (HSM) for encryption. Defaults to false."
  type        = bool
  default     = false
}

variable "kind" {
  description = "(Optional) Specifies the type of Cognitive Service Account that should be created. Possible values are Academic, AIServices,  AnomalyDetector, Bing.Autosuggest, Bing.Autosuggest.v7, Bing.CustomSearch, Bing.Search, Bing.Search.v7, Bing.Speech, Bing.SpellCheck, Bing.SpellCheck.v7, CognitiveServices, ComputerVision, ContentModerator, ContentSafety, CustomSpeech, CustomVision.Prediction, CustomVision.Training, Emotion, Face, FormRecognizer, ImmersiveReader, LUIS, LUIS.Authoring, MetricsAdvisor, OpenAI, Personalizer, QnAMaker, Recommendations, SpeakerRecognition, Speech, SpeechServices, SpeechTranslation, TextAnalytics, TextTranslation and WebLM. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "local_auth_enabled" {
  description = "(Optional) Whether local authentication methods is enabled for the Cognitive Account. Defaults to true."
  type        = bool
  default     = null
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "metrics_advisor_aad_client_id" {
  description = "(Optional) The Azure AD Client ID (Application ID). This attribute is only set when kind is MetricsAdvisor. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "metrics_advisor_aad_tenant_id" {
  description = "(Optional) The Azure AD Tenant ID. This attribute is only set when kind is MetricsAdvisor. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "metrics_advisor_super_user_name" {
  description = "(Optional) The super user of Metrics Advisor. This attribute is only set when kind is MetricsAdvisor. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "metrics_advisor_website_name" {
  description = "(Optional) The website name of Metrics Advisor. This attribute is only set when kind is MetricsAdvisor. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "name" {
  description = "(Required) Specifies the name of the Cognitive Service or AI Service Account. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "network_acls" {
  description = "- default_action - (Required) The Default Action to use when no rules match from ip_rules / virtual_network_rules. Possible values are Allow and Deny.\n- ip_rules - (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Cognitive Account.\n- bypass - (Optional) Whether to allow trusted Azure Services to access the service. Possible values are None and AzureServices\n\n---\nvirtual_network_rules block supports the following:\n- ignore_missing_vnet_service_endpoint - (Optional) Whether ignore missing vnet service endpoint or not. Default to false.\n- subnet_id - (Required) The ID of the subnet which should be able to access this Cognitive Account.\n"
  type = object({
    default_action = string
    ip_rules       = optional(set(string))
    virtual_network_rules = optional(set(object({
      ignore_missing_vnet_service_endpoint = optional(bool)
      subnet_id                            = string
    })))
    bypass = optional(string)
  })
  default = null
}

variable "network_injections" {
  description = "  Controls the Network Injections on this resource. The following properties can be specified:\n - subnet_id - (Required) Full resource id of the Subnet resource.\n - scenario - (Required) The scenario for the network injection. Only agent is supported.\n - microsoft_managed_network_enabled - (Optional) Whether to use a Microsoft managed network.\n"
  type = object({
    subnet_id                         = string
    scenario                          = string
    microsoft_managed_network_enabled = optional(bool, false)
  })
  default = null
}

variable "outbound_network_access_restricted" {
  description = "(Optional) Whether outbound network access is restricted for the Cognitive Account. Defaults to false."
  type        = bool
  default     = null
}

variable "parent_id" {
  description = "(Required) The parent resource ID where the Cognitive Service or AI Service Account is created. This should be the ID of the resource group. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "private_endpoints" {
  description = "  A map of private endpoints to create on the Cognitive Service Account.\n\n  - name - (Optional) The name of the private endpoint. One will be generated if not set.\n  - role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n  - lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n  - tags - (Optional) A mapping of tags to assign to the private endpoint.\n  - subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n  - private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n  - private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n  - network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n  - location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n  - resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the Cognitive Services Account.\n  - ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n    - name - The name of the IP configuration.\n    - private_ip_address - The private IP address of the IP configuration.\n"
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

variable "private_endpoints_manage_dns_zone_group" {
  description = "Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "(Optional) Whether public network access is allowed for the Cognitive Account. Defaults to true."
  type        = bool
  default     = true
}

variable "qna_runtime_endpoint" {
  description = "(Optional) A URL to link a QnAMaker cognitive account to a QnA runtime."
  type        = string
  default     = null
}

variable "rai_monitor_config" {
  description = "  Controls the Rai Monitor configuration on this resource. The following properties can be specified:\n - adx_storage_resource_id - (Required) Full resource id of Storage.\n - identity_client_id - (Optional) The client ID of the managed identity associated with the Storage.\n"
  type = object({
    adx_storage_resource_id = string
    identity_client_id      = optional(string, null)
  })
  default = null
}

variable "rai_policies" {
  description = "- name - (Required) The name of the RAI policy. Changing this forces a new resource to be created.\n- base_policy_name - (Required) The name of the base policy. Changing this forces a new resource to be created.\n- mode - Rai policy mode. The enum value mapping is as below: Default, Deferred, Blocking, Asynchronous_filter. Please use 'Asynchronous_filter' after 2024-10-01. It is the same as 'Deferred' in previous version.\n\n---\ncontent_filters block supports the following:\n- name - (Required) Name of ContentFilter.\n- enabled - (Required) If the ContentFilter is enabled.\n- severity_threshold - (Required) Level at which content is filtered. Possible values are Low, Medium, High.\n- blocking - (Required) If blocking would occur.\n- source - (Required) Content source to apply the Content Filters. Possible values are Prompt, Completion.\n\n---\ncustom_block_lists block supports the following:\n- source - (Required) Content source to apply the Custom Block Lists. Possible values are Prompt, Completion.\n- block_list_name - (Required) Name of ContentFilter.\n- blocking - (Required) If blocking would occur.\n"
  type = map(object({
    name             = string
    base_policy_name = string
    mode             = string
    content_filters = optional(list(object({
      blocking           = bool
      enabled            = bool
      name               = string
      severity_threshold = string
      source             = string
    })))
    custom_block_lists = optional(list(object({
      source          = string
      block_list_name = string
      blocking        = bool
    })))
  }))
  default = {}
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "sku_name" {
  description = "(Required) Specifies the SKU Name for this Cognitive Service or AI Service Account. Possible values are F0, F1, S0, S, S1, S2, S3, S4, S5, S6, P0, P1, P2, E0 and DC0."
  type        = string
  default     = ""
}

variable "storage" {
  description = "- identity_client_id - (Optional) The client ID of the managed identity associated with the storage resource.\n- storage_account_id - (Required) Full resource id of a Microsoft.Storage resource.\n"
  type = list(object({
    identity_client_id = optional(string)
    storage_account_id = string
  }))
  default = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating the Cognitive Service or AI Service Account.\n- delete - (Defaults to 30 minutes) Used when deleting the Cognitive Service or AI Service Account.\n- read - (Defaults to 5 minutes) Used when retrieving the Cognitive Service or AI Service Account.\n- update - (Defaults to 30 minutes) Used when updating the Cognitive Service or AI Service Account.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
