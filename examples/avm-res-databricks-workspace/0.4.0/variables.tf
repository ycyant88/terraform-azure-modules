variable "access_connector" {
  description = "\nConfiguration options for the Databricks Access Connector resource. This map includes the following attributes:\n\n- name (Required): Specifies the name of the Databricks Access Connector resource. Changing this forces a new resource to be created.\n- resource_group_name (Optional): The name of the Resource Group in which the Databricks Access Connector should exist. Defaults to the resource group of the databricks instance.\n- location (Optional): Specifies the supported Azure location where the resource has to be created. Defaults to the location of the databricks instance.\n- identity (Optional): An identity block. This block supports the following:\n  - type (Required): Specifies the type of Managed Service Identity that should be configured on the Databricks Access Connector. Possible values include SystemAssigned or UserAssigned.\n  - identity_ids (Optional): Specifies a list of User Assigned Managed Identity IDs to be assigned to the Databricks Access Connector. Only one User Assigned Managed Identity ID is supported per Databricks Access Connector resource. Note: identity_ids are required when type is set to UserAssigned.\n- tags (Optional): A mapping of tags to assign to the resource.\n"
  type = map(object({
    name                = string
    resource_group_name = optional(string, null)
    location            = optional(string, null)
    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))
    tags = optional(map(string))
  }))
  default = {}
}

variable "access_connector_id" {
  description = "  The ID of the Databricks Access Connector to provide access to the workspace.\n  The access_connector_id field is required when default_storage_firewall_enabled is set to true.\n"
  type        = string
  default     = null
}

variable "custom_parameters" {
  description = "A map of custom parameters for configuring the Databricks Workspace. This object allows for detailed configuration, with each attribute representing a specific setting:\n\n- machine_learning_workspace_id - (Optional) The ID of an Azure Machine Learning workspace to link with the Databricks workspace.\n- nat_gateway_name - (Optional) Name of the NAT gateway for Secure Cluster Connectivity (No Public IP) workspace subnets. Defaults to 'nat-gateway'.\n- public_ip_name - (Optional) Name of the Public IP for No Public IP workspace with managed vNet. Defaults to 'nat-gw-public-ip'.\n- no_public_ip - (Optional) Specifies whether public IP Addresses are not allowed. Defaults to false. Note: Updating this parameter is only allowed if the value is changing from false to true and only for VNet-injected workspaces.\n- public_subnet_name - (Optional) The name of the Public Subnet within the Virtual Network.\n- public_subnet_network_security_group_association_id - (Optional) The resource ID of the azurerm_subnet_network_security_group_association which is referred to by the public_subnet_name field.\n- private_subnet_name - (Optional) The name of the Private Subnet within the Virtual Network.\n- private_subnet_network_security_group_association_id - (Optional) The resource ID of the azurerm_subnet_network_security_group_association which is referred to by the private_subnet_name field.\n- storage_account_name - (Optional) Default Databricks File Storage account name. Defaults to a randomized name.\n- storage_account_sku_name - (Optional) Storage account SKU name. Defaults to 'Standard_GRS'.\n- virtual_network_id - (Optional) The ID of a Virtual Network where the Databricks Cluster should be created. More information about VNet injection can be found [here](https://learn.microsoft.com/en-us/azure/databricks/administration-guide/cloud-configurations/azure/vnet-inject).\n- vnet_address_prefix - (Optional) Address prefix for Managed virtual network. Defaults to '10.139'.\n\nNote: Databricks requires that a network security group is associated with the public and private subnets when a virtual_network_id has been defined.\n"
  type = object({
    machine_learning_workspace_id                        = optional(string, null)
    nat_gateway_name                                     = optional(string)
    public_ip_name                                       = optional(string)
    no_public_ip                                         = optional(bool, false)
    public_subnet_name                                   = optional(string, null)
    public_subnet_network_security_group_association_id  = optional(string, null)
    private_subnet_name                                  = optional(string, null)
    private_subnet_network_security_group_association_id = optional(string, null)
    storage_account_name                                 = optional(string, null) # Defaults to a randomized name
    storage_account_sku_name                             = optional(string, "Standard_GRS")
    virtual_network_id                                   = optional(string, null)
    vnet_address_prefix                                  = optional(string)
  })
  default = {}
}

variable "customer_managed_key_enabled" {
  description = "  Is the workspace enabled for customer managed key encryption? If true this enables the Managed Identity for the managed storage account.\n  Possible values are true or false. Defaults to false.\n  This field is only valid if the Databricks Workspace sku is set to premium.\n"
  type        = bool
  default     = false
}

variable "dbfs_root_cmk_key_vault_key_id" {
  description = "    The ID of the customer-managed key for DBFS root.\n    This is required when customer_managed_key_enabled is set to true.\n"
  type        = string
  default     = null
}

variable "default_storage_firewall_enabled" {
  description = "  Disallow public access to default storage account. Defaults to false.\n"
  type        = bool
  default     = false
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the storage account. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "enhanced_security_compliance" {
  description = "Enhanced Security and Compliance configuration for the Databricks Workspace. This feature is only valid if sku is set to 'premium'.\n\n- automatic_cluster_update_enabled - (Optional) Enables automatic cluster updates for this workspace. Defaults to false.\n- compliance_security_profile_enabled - (Optional) Enables compliance security profile for this workspace. Defaults to false.\n  NOTE: Changing the value of compliance_security_profile_enabled from true to false forces a replacement of the Databricks workspace.\n  NOTE: The attributes automatic_cluster_update_enabled and enhanced_security_monitoring_enabled must be set to true in order to set compliance_security_profile_enabled to true.\n- compliance_security_profile_standards - (Optional) A list of standards to enforce on this workspace. Possible values include 'HIPAA', 'PCI_DSS', 'HITRUST', 'IRAP_PROTECTED', 'UK_CYBER_ESSENTIALS_PLUS', 'CANADA_PROTECTED_B', or 'NONE'.\n  NOTE: compliance_security_profile_enabled must be set to true in order to use compliance_security_profile_standards.\n  NOTE: Removing a standard from the compliance_security_profile_standards list forces a replacement of the Databricks workspace.\n- enhanced_security_monitoring_enabled - (Optional) Enables enhanced security monitoring for this workspace. Defaults to false.\n"
  type = object({
    automatic_cluster_update_enabled      = optional(bool, false)
    compliance_security_profile_enabled   = optional(bool, false)
    compliance_security_profile_standards = optional(list(string), [])
    enhanced_security_monitoring_enabled  = optional(bool, false)
  })
  default = null
}

variable "infrastructure_encryption_enabled" {
  description = "  By default, Azure encrypts storage account data at rest. Infrastructure encryption adds a second layer of encryption to your storage account's data\n  Possible values are true or false. Defaults to false.\n  This field is only valid if the Databricks Workspace sku is set to premium.\n  Changing this forces a new resource to be created.\n"
  type        = bool
  default     = false
}

variable "load_balancer_backend_address_pool_id" {
  description = "Resource ID of the Outbound Load balancer Backend Address Pool for Secure Cluster Connectivity (No Public IP) workspace. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "location" {
  description = "Azure region where the resource should be deployed."
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

variable "managed_disk_cmk_key_vault_id" {
  description = "    Resource ID of the Key Vault which contains the managed_disk_cmk_key_vault_key_id key.\n\n    NOTE: The managed_disk_cmk_key_vault_id field is only required if the Key Vault exists in a different subscription than the Databricks Workspace.\n    If the managed_disk_cmk_key_vault_id field is not specified it is assumed that the managed_disk_cmk_key_vault_key_id is hosted in the same subscription as the Databricks Workspace.\n\n    NOTE: If you are using multiple service principals to execute Terraform across subscriptions you will need to add an additional azurerm_key_vault_access_policy resource granting the service principal access to the key vault in that subscription.\n"
  type        = string
  default     = null
}

variable "managed_disk_cmk_key_vault_key_id" {
  description = "  Customer managed encryption properties for the Databricks Workspace managed disks.\n\n  Once the Databricks Workspace is created, the managed disk encryption set must be added to the key vault access policy, this can be found in the managed resource group under the name 'databricks-encryption-set-<workspace-name>'.\n  This resource ID can be used to create a Key Vault access policy for the managed disk encryption set. RBA role 'Key Vault Crypto Officer' is required to create the access policy.\n  The Key Vault access policy should be created with the following permissions: 'Get', 'Wrap Key', 'Unwrap Key', 'Sign', 'Verify', 'List'. or Key Vault Crypto User role.\n\n  NOTE: Disabling CMK for Disk is currently not supported. If you want to disable Managed Services, you must delete the workspace and create a new one.\n"
  type        = string
  default     = null
}

variable "managed_disk_cmk_rotation_to_latest_version_enabled" {
  description = "Whether customer managed keys for disk encryption will automatically be rotated to the latest version. Optional."
  type        = bool
  default     = false
}

variable "managed_resource_group_name" {
  description = "  The name of the resource group where Azure should place the managed Databricks resources.\n  Changing this forces a new resource to be created.\n\n  NOTE: Make sure that this field is unique if you have multiple Databrick Workspaces deployed in your subscription and choose to not have the managed_resource_group_name auto generated by the Azure Resource Provider. Having multiple Databrick Workspaces deployed in the same subscription with the same manage_resource_group_name may result in some resources that cannot be deleted.\n"
  type        = string
  default     = null
}

variable "managed_services_cmk_key_vault_id" {
  description = "    Resource ID of the Key Vault which contains the managed_services_cmk_key_vault_key_id key.\n\n    NOTE: The managed_services_cmk_key_vault_id field is only required if the Key Vault exists in a different subscription than the Databricks Workspace.\n    If the managed_services_cmk_key_vault_id field is not specified it is assumed that the managed_services_cmk_key_vault_key_id is hosted in the same subscription as the Databricks Workspace.\n\n    NOTE: If you are using multiple service principals to execute Terraform across subscriptions you will need to add an additional azurerm_key_vault_access_policy resource granting the service principal access to the key vault in that subscription.\n"
  type        = string
  default     = null
}

variable "managed_services_cmk_key_vault_key_id" {
  description = "    Databricks Workspace Customer Managed Keys for Managed Services(e.g. Notebooks and Artifacts).\n\n    To find the correct Object ID to use for the Key vault access policy for managed services, follow these steps:\n    1. Go to portal -> Azure Active Directory.\n    2. In the search your tenant bar enter the value 2ff814a6-3304-4ab8-85cb-cd0e6f879c1d.\n    3. You will see under Enterprise application results AzureDatabricks, click on the AzureDatabricks search result.\n    4. This will open the Enterprise Application overview blade where you will see three values, the name of the application, the application ID, and the object ID.\n    5. The value you want is the object ID.\n    6. The Key Vault access policy should be created with the following permissions: 'Get', 'Wrap Key', 'Unwrap Key', 'Sign', 'Verify', 'List'. or Key Vault Crypto User role.\n\n\n    NOTE: Disabling Managed Services (aka CMK for Notebook) is currently not supported. If you want to disable Managed Services, you must delete the workspace and create a new one.\n\n"
  type        = string
  default     = null
}

variable "name" {
  description = "Specifies the name of the Databricks Workspace resource. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "network_security_group_rules_required" {
  description = "  Does the data plane (clusters) to control plane communication happen over private link endpoint only or publicly?\n  Possible values AllRules, NoAzureDatabricksRules or NoAzureServiceRules.\n  Required when public_network_access_enabled is set to false.\n"
  type        = string
  default     = null
}

variable "private_endpoints" {
  description = "  A map of private endpoints to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the private endpoint. One will be generated if not set.\n  - role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n    - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n    - principal_id - The ID of the principal to assign the role to.\n    - description - (Optional) The description of the role assignment.\n    - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n    - condition - (Optional) The condition which will be used to scope the role assignment.\n    - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n    - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n    - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  - lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n    - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n    - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n  - tags - (Optional) A mapping of tags to assign to the private endpoint.\n  - subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n  - subresource_name - The name of the sub resource for the private endpoint.\n  - private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n  - private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n  - network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n  - location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n  - resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the Key Vault.\n  - ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n    - name - The name of the IP configuration.\n    - private_ip_address - The private IP address of the IP configuration.\n"
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
    subresource_name                        = string # NOTE: `subresource_name` can be excluded if the resource does not support multiple sub resource types (e.g. storage account supports blob, queue, etc)
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
  description = "  Allow public access for accessing workspace. Set value to false to access workspace only via private link endpoint.\n  Possible values include true or false. Defaults to true.\n  Creation of workspace with PublicNetworkAccess property set to false is only supported for VNet Injected workspace.\n"
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Databricks Workspace should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
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

variable "sku" {
  description = "  The 'sku' value must be one of 'standard', 'premium', or 'trial'.\n\n  IMPORTANT: The standard sku will be deprecated in October 2026, please use premium sku instead, for more information please visit https://learn.microsoft.com/azure/databricks/admin/account-settings/standard-tier\n\n  NOTE: Downgrading to a trial sku from a standard or premium sku will force a new resource to be created.\n\n"
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "virtual_network_peering" {
  description = "A map of virtual network peering configurations. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\n- name - (Optional) Specifies the name of the Databricks Virtual Network Peering resource. Changing this forces a new resource to be created.\n- resource_group_name - (Optional) The name of the Resource Group in which the Databricks Virtual Network Peering should exist.  Defaults to the resource group of the databricks instance.\n- remote_address_space_prefixes - (Required) A list of address blocks reserved for the remote virtual network in CIDR notation. Changing this forces a new resource to be created.\n- remote_virtual_network_id - (Required) The ID of the remote virtual network. Changing this forces a new resource to be created.\n- allow_virtual_network_access - (Optional) Can the VMs in the local virtual network space access the VMs in the remote virtual network space? Defaults to true.\n- allow_forwarded_traffic - (Optional) Can the forwarded traffic from the VMs in the local virtual network be forwarded to the remote virtual network? Defaults to false.\n- allow_gateway_transit - (Optional) Can the gateway links be used in the remote virtual network to link to the Databricks virtual network? Defaults to false.\n- use_remote_gateways - (Optional) Can remote gateways be used on the Databricks virtual network? Defaults to false.\n                          If the use_remote_gateways is set to true, and allow_gateway_transit on the remote peering is also true, the virtual network will use the gateways of the remote virtual network for transit. Only one peering can have this flag set to true. use_remote_gateways cannot be set if the virtual network already has a gateway.\n"
  type = map(object({
    name                          = optional(string, null)
    resource_group_name           = optional(string, null)
    remote_address_space_prefixes = list(string)
    remote_virtual_network_id     = string
    allow_virtual_network_access  = optional(bool, true)
    allow_forwarded_traffic       = optional(bool, false)
    allow_gateway_transit         = optional(bool, false)
    use_remote_gateways           = optional(bool, false)
  }))
  default = {}
}
