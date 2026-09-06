variable "allowed_fqdns" {
  description = "(Optional) List of allowed FQDNs(Fully Qualified Domain Name) for egress from Cluster."
  type        = set(string)
  default     = null
}

variable "allowed_ip_ranges" {
  description = "(Optional) The list of ips in the format of CIDR allowed to connect to the cluster."
  type        = set(string)
  default     = null
}

variable "auto_stop_enabled" {
  description = "(Optional) Specifies if the cluster could be automatically stopped \n(due to lack of data or no activity for many days). \n\nDefaults to true.\n"
  type        = bool
  default     = true
}

variable "customer_managed_key" {
  description = "Customer managed keys that should be associated with the resource."
  type = object({
    key_vault_resource_id              = optional(string)
    key_name                           = optional(string)
    key_version                        = optional(string, null)
    user_assigned_identity_resource_id = optional(string, null)
  })
  default = {}
}

variable "databases" {
  description = "(Optional) A map of kusto database objects:\n\n- name - (Required) The name of the Kusto Database to create. Changing this forces a new resource to be created.\n- location - (Optional) The location where the Kusto Database should be created. If not provided, will default to the location of the kusto cluster. Changing this forces a new resource to be created.\n- resource_group_name - (Optional) Specifies the Resource Group where the Kusto Database should exist. If not provided, will default to the location of the kusto cluster. Changing this forces a new resource to be created.\n- cluster_name - (Optional) Specifies the name of the Kusto Cluster this database will be added to. If not provided, will default to the location of the kusto cluster. Changing this forces a new resource to be created.\n- hot_cache_period - (Optional) The time the data that should be kept in cache for fast queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan.\n- soft_delete_period - (Optional) The time the data should be kept before it stops being accessible to queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan\n"
  type = map(object({
    name                = string
    location            = optional(string, null)
    resource_group_name = optional(string, null)
    cluster_name        = optional(string, null)
    hot_cache_period    = optional(string)
    soft_delete_period  = optional(string)
  }))
  default = {}
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n"
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

variable "disk_encryption_enabled" {
  description = "(Optional) Specifies if the cluster's disks are encrypted."
  type        = bool
  default     = true
}

variable "double_encryption_enabled" {
  description = "(Optional) Is the cluster's double encryption enabled? Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "kusto_cluster_principal_assignments" {
  description = "A map that manages a Kusto Cluster Principal Assignment.\n\n- name (Required) The name of the Kusto cluster principal assignment. Changing this forces a new resource to be created.\n- principal_id (Required) The object id of the principal. Changing this forces a new resource to be created.\n- principal_type (Required) The type of the principal. Valid values include App, Group, User. Changing this forces a new resource to be created.\n- role (Required) The cluster role assigned to the principal. Valid values include AllDatabasesAdmin and AllDatabasesViewer. Changing this forces a new resource to be created.\n- tenant_id (Required) The tenant id in which the principal resides. Changing this forces a new resource to be created.\n"
  type = map(object({
    name           = string
    principal_id   = string
    principal_type = string
    role           = string
    tenant_id      = string
  }))
  default = {}
}

variable "kusto_database_principal_assignment" {
  description = "A map that manages a Kusto (also known as Azure Data Explorer) Database Principal Assignment.\n\n- database_name (Required) The name of the database in which to create the resource. Changing this forces a new resource to be created.\n- name (Required) The name of the Kusto cluster principal assignment. Changing this forces a new resource to be created.\n- principal_id (Required) The object id of the principal. Changing this forces a new resource to be created.\n- principal_type (Required) The type of the principal. Valid values include App, Group, User. Changing this forces a new resource to be created.\n- role (Required) The cluster role assigned to the principal. Valid values include AllDatabasesAdmin and AllDatabasesViewer. Changing this forces a new resource to be created.\n- tenant_id (Required) The tenant id in which the principal resides. Changing this forces a new resource to be created.\n"
  type = map(object({
    database_name  = string
    name           = string
    principal_id   = string
    principal_type = string
    role           = string
    tenant_id      = string
  }))
  default = {}
}

variable "language_extensions" {
  description = "(Optional) An list of language_extensions to enable. \n  \nValid values are: PYTHON, PYTHON_3.10.8 and R. \n  \nPYTHON is used to specify Python 3.6.5 image and PYTHON_3.10.8 is used to specify Python 3.10.8 image.\nNote that PYTHON_3.10.8 is only available in skus which support nested virtualization.\n\nNOTE:\nIn v4.0.0 and later version of the AzureRM Provider, \nlanguage_extensions will be changed to a list of language_extension block. \nIn each block, name and image are required. \nname is the name of the language extension, possible values are PYTHON, R. \nimage is the image of the language extension, possible values are Python3_6_5, Python3_10_8 and R.\n"
  type        = set(string)
  default     = null
}

variable "location" {
  description = "Azure region where the resource should be deployed.  If null, the location will be inferred from the resource group location."
  type        = string
  default     = null
}

variable "lock" {
  description = "The lock level to apply. Default is None. Possible values are None, CanNotDelete, and ReadOnly."
  type = object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
  default = {}
}

variable "managed_identities" {
  description = "Managed identities to be created for the resource."
  type = object({
    type                       = string
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = null
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "optimized_auto_scale" {
  description = "A optimized_auto_scale block supports the following:\n\nminimum_instances - (Required) The minimum number of allowed instances. Must between 0 and 1000.\n\nmaximum_instances - (Required) The maximum number of allowed instances. Must between 0 and 1000.\n"
  type = object({
    maximum_instances = number
    minimum_instances = number
  })
  default = null
}

variable "outbound_network_access_restricted" {
  description = "(Optional) Whether to restrict outbound network access. \nValue is optional but if passed in, must be true or false.\n  \nDefault is false.\n"
  type        = bool
  default     = false
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
    })), {})
    lock = optional(object({
      name = optional(string, null)
      kind = optional(string, "None")
    }), {})
    tags                                    = optional(map(any), null)
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

variable "public_ip_type" {
  description = "(Optional) Indicates what public IP type to create - IPv4 (default), or DualStack (both IPv4 and IPv6). Defaults to IPv4."
  type        = string
  default     = "IPv4"
}

variable "public_network_access_enabled" {
  description = "(Optional) Is the public network access enabled? Defaults to true."
  type        = bool
  default     = false
}

variable "purge_enabled" {
  description = "(Optional) Specifies if the purge operations are enabled."
  type        = bool
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
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

variable "sku" {
  description = "A sku block supports the following:\n\nname - (Required) The name of the SKU. \n  \nPossible values are:\n- Dev(No SLA)_Standard_D11_v2, \n- Dev(No SLA)_Standard_E2a_v4, \n- Standard_D14_v2, \n- Standard_D11_v2, \n- Standard_D16d_v5, \n- Standard_D13_v2, \n- Standard_D12_v2, \n- Standard_DS14_v2+4TB_PS, \n- Standard_DS14_v2+3TB_PS, \n- Standard_DS13_v2+1TB_PS, \n- Standard_DS13_v2+2TB_PS, \n- Standard_D32d_v5, \n- Standard_D32d_v4, \n- Standard_EC8ads_v5, \n- Standard_EC8as_v5+1TB_PS, \n- Standard_EC8as_v5+2TB_PS, \n- Standard_EC16ads_v5, \n- Standard_EC16as_v5+4TB_PS, \n- Standard_EC16as_v5+3TB_PS, \n- Standard_E80ids_v4, \n- Standard_E8a_v4, \n- Standard_E8ads_v5, \n- Standard_E8as_v5+1TB_PS, \n- Standard_E8as_v5+2TB_PS, \n- Standard_E8as_v4+1TB_PS, \n- Standard_E8as_v4+2TB_PS, \n- Standard_E8d_v5, \n- Standard_E8d_v4, \n- Standard_E8s_v5+1TB_PS, \n- Standard_E8s_v5+2TB_PS, \n- Standard_E8s_v4+1TB_PS, \n- Standard_E8s_v4+2TB_PS, \n- Standard_E4a_v4, \n- Standard_E4ads_v5, \n- Standard_E4d_v5, \n- Standard_E4d_v4, \n- Standard_E16a_v4, \n- Standard_E16ads_v5, \n- Standard_E16as_v5+4TB_PS, \n- Standard_E16as_v5+3TB_PS, \n- Standard_E16as_v4+4TB_PS, \n- Standard_E16as_v4+3TB_PS, \n- Standard_E16d_v5, \n- Standard_E16d_v4, \n- Standard_E16s_v5+4TB_PS, \n- Standard_E16s_v5+3TB_PS, \n- Standard_E16s_v4+4TB_PS, \n- Standard_E16s_v4+3TB_PS, \n- Standard_E64i_v3, \n- Standard_E2a_v4, \n- Standard_E2ads_v5, \n- Standard_E2d_v5, \n- Standard_E2d_v4, \n- Standard_L8as_v3, \n- Standard_L8s, \n- Standard_L8s_v3, \n- Standard_L8s_v2, \n- Standard_L4s, \n- Standard_L16as_v3, \n- Standard_L16s, \n- Standard_L16s_v3, \n- Standard_L16s_v2, \n- Standard_L32as_v3 \n- Standard_L32s_v3\ncapacity - (Optional) Specifies the node count for the cluster. Boundaries depend on the SKU name.\nNOTE:\nIf no optimized_auto_scale block is defined, then the capacity is required. ~> NOTE: If an optimized_auto_scale block is defined and no capacity is set, then the capacity is initially set to the value of minimum_instances.\n"
  type = object({
    name     = string
    capacity = number
  })
  default = ""
}

variable "streaming_ingestion_enabled" {
  description = "(Optional) Specifies if the streaming ingest is enabled."
  type        = bool
  default     = null
}

variable "tags" {
  description = "Map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "trusted_external_tenants" {
  description = "(Optional) Specifies a list of tenant IDs that are trusted by the cluster. \nNew or updated Kusto Cluster will only allow your own tenant by default. \n\nUse trusted_external_tenants = [\"*\"] to explicitly allow all other tenants, \ntrusted_external_tenants = [] for only your tenant or \ntrusted_external_tenants = [\"<tenantId1>\", \"<tenantIdx>\"] to allow specific other tenants.\n"
  type        = set(string)
  default     = []
}

variable "virtual_network_configuration" {
  description = "(Optional) A virtual_network_configuration block as defined below. \nChanging this forces a new resource to be created.\n\nA virtual_network_configuration block supports the following:\n\nsubnet_id - (Required) The subnet resource id.\n\nengine_public_ip_id - (Required) Engine service's public IP address resource id.\n\ndata_management_public_ip_id - (Required) Data management's service public IP address resource id.\n"
  type = object({
    data_management_public_ip_id = string
    engine_public_ip_id          = string
    subnet_id                    = string
  })
  default = null
}

variable "zones" {
  description = "(Optional) Specifies a list of Availability Zones in which this Kusto Cluster should be located. Changing this forces a new Kusto Cluster to be created."
  type        = set(string)
  default     = null
}
