variable "account_replication_type" {
  description = "The replication type for the storage account."
  type        = string
  default     = "ZRS"
}

variable "adou_path" {
  description = "The Active Directory OU path."
  type        = string
  default     = ""
}

variable "allow_nested_items_to_be_public" {
  description = "Indicates whether nested items can be public."
  type        = bool
  default     = false
}

variable "azure_service_endpoint" {
  description = "The Azure service endpoint."
  type        = string
  default     = "core.windows.net"
}

variable "azure_stack_lcm_user_credential_content_type" {
  description = "(Optional) Content type of the azure stack lcm user credential."
  type        = string
  default     = null
}

variable "azure_stack_lcm_user_credential_tags" {
  description = "(Optional) Tags of the azure stack lcm user credential."
  type        = map(string)
  default     = null
}

variable "cluster_name" {
  description = "The name of the HCI cluster."
  type        = string
  default     = ""
}

variable "cluster_tags" {
  description = "(Optional) Tags of the cluster."
  type        = map(string)
  default     = null
}

variable "compute_intent_name" {
  description = "The name of compute intent."
  type        = string
  default     = "ManagementCompute"
}

variable "compute_override_adapter_property" {
  description = "Indicates whether to override adapter property for compute."
  type        = bool
  default     = true
}

variable "compute_qos_policy_overrides" {
  description = "QoS policy overrides for network settings with required properties for compute."
  type = object({
    priorityValue8021Action_SMB     = string
    priorityValue8021Action_Cluster = string
    bandwidthPercentage_SMB         = string
  })
  default = { "bandwidthPercentage_SMB" : "", "priorityValue8021Action_Cluster" : "", "priorityValue8021Action_SMB" : "" }
}

variable "compute_rdma_enabled" {
  description = "Indicates whether RDMA is enabled for compute."
  type        = bool
  default     = false
}

variable "compute_traffic_type" {
  description = "Traffic type of compute."
  type        = list(string)
  default     = ["Management", "Compute"]
}

variable "create_key_vault" {
  description = "Set to true to create the key vault, or false to skip it"
  type        = bool
  default     = true
}

variable "create_witness_storage_account" {
  description = "Set to true to create the witness storage account, or false to skip it"
  type        = bool
  default     = true
}

variable "cross_tenant_replication_enabled" {
  description = "Indicates whether cross-tenant replication is enabled."
  type        = bool
  default     = false
}

variable "custom_location_name" {
  description = "The name of the custom location."
  type        = string
  default     = ""
}

variable "default_arb_application_content_type" {
  description = "(Optional) Content type of the default arb application."
  type        = string
  default     = null
}

variable "default_arb_application_tags" {
  description = "(Optional) Tags of the default arb application."
  type        = map(string)
  default     = null
}

variable "default_gateway" {
  description = "The default gateway for the network."
  type        = string
  default     = ""
}

variable "deployment_user" {
  description = "The username for the domain administrator account."
  type        = string
  default     = ""
}

variable "deployment_user_password" {
  description = "The password for the domain administrator account."
  type        = string
  default     = ""
}

variable "dns_servers" {
  description = "A list of DNS server IP addresses."
  type        = list(string)
  default     = ""
}

variable "domain_fqdn" {
  description = "The domain FQDN."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ending_address" {
  description = "The ending IP address of the IP address range."
  type        = string
  default     = ""
}

variable "eu_location" {
  description = "Indicates whether the location is in EU."
  type        = bool
  default     = false
}

variable "intent_name" {
  description = "The name of intent."
  type        = string
  default     = "ManagementComputeStorage"
}

variable "is_exported" {
  description = "Indicate whether the resource is exported"
  type        = bool
  default     = false
}

variable "key_vault_location" {
  description = "The location of the key vault."
  type        = string
  default     = ""
}

variable "key_vault_resource_group" {
  description = "The resource group of the key vault."
  type        = string
  default     = ""
}

variable "keyvault_name" {
  description = "The name of the key vault."
  type        = string
  default     = ""
}

variable "keyvault_purge_protection_enabled" {
  description = "Indicates whether purge protection is enabled."
  type        = bool
  default     = true
}

variable "keyvault_soft_delete_retention_days" {
  description = "The number of days that items should be retained for soft delete."
  type        = number
  default     = 30
}

variable "keyvault_tags" {
  description = "(Optional) Tags of the keyvault."
  type        = map(string)
  default     = null
}

variable "local_admin_credential_content_type" {
  description = "(Optional) Content type of the local admin credential."
  type        = string
  default     = null
}

variable "local_admin_credential_tags" {
  description = "(Optional) Tags of the local admin credential."
  type        = map(string)
  default     = null
}

variable "local_admin_password" {
  description = "The password for the local administrator account."
  type        = string
  default     = ""
}

variable "local_admin_user" {
  description = "The username for the local administrator account."
  type        = string
  default     = ""
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

variable "management_adapters" {
  description = "A list of management adapters."
  type        = list(string)
  default     = ""
}

variable "min_tls_version" {
  description = "The minimum TLS version."
  type        = string
  default     = "TLS1_2"
}

variable "name" {
  description = "The name of the HCI cluster. Must be the same as the name when preparing AD."
  type        = string
  default     = ""
}

variable "operation_type" {
  description = "The intended operation for a cluster."
  type        = string
  default     = "ClusterProvisioning"
}

variable "override_adapter_property" {
  description = "Indicates whether to override adapter property."
  type        = bool
  default     = true
}

variable "qos_policy_overrides" {
  description = "QoS policy overrides for network settings with required properties."
  type = object({
    priorityValue8021Action_SMB     = string
    priorityValue8021Action_Cluster = string
    bandwidthPercentage_SMB         = string
  })
  default = { "bandwidthPercentage_SMB" : "", "priorityValue8021Action_Cluster" : "", "priorityValue8021Action_SMB" : "" }
}

variable "random_suffix" {
  description = "Indicate whether to add random suffix"
  type        = bool
  default     = true
}

variable "rdma_enabled" {
  description = "Enables RDMA when set to true. In a converged network configuration, this will make the network use RDMA. In a dedicated storage network configuration, enabling this will enable RDMA on the storage network."
  type        = bool
  default     = false
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
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "rp_service_principal_object_id" {
  description = "The object ID of the HCI resource provider service principal."
  type        = string
  default     = ""
}

variable "secrets_location" {
  description = "Secrets location for the deployment."
  type        = string
  default     = ""
}

variable "servers" {
  description = "A list of servers with their names and IPv4 addresses."
  type = list(object({
    name        = string
    ipv4Address = string
  }))
  default = ""
}

variable "service_principal_id" {
  description = "The service principal ID for the Azure account."
  type        = string
  default     = ""
}

variable "service_principal_secret" {
  description = "The service principal secret for the Azure account."
  type        = string
  default     = ""
}

variable "site_id" {
  description = "A unique identifier for the site."
  type        = string
  default     = ""
}

variable "starting_address" {
  description = "The starting IP address of the IP address range."
  type        = string
  default     = ""
}

variable "storage_connectivity_switchless" {
  description = "Indicates whether storage connectivity is switchless."
  type        = bool
  default     = ""
}

variable "storage_intent_name" {
  description = "The name of storage intent."
  type        = string
  default     = "Storage"
}

variable "storage_networks" {
  description = "A list of storage networks."
  type = list(object({
    name               = string
    networkAdapterName = string
    vlanId             = string
    storageAdapterIPInfo = optional(object({
      physicalNode = string
      ipv4Address  = string
      subnetMask   = string
    }))
  }))
  default = ""
}

variable "storage_override_adapter_property" {
  description = "Indicates whether to override adapter property for storagte."
  type        = bool
  default     = true
}

variable "storage_qos_policy_overrides" {
  description = "QoS policy overrides for network settings with required properties for storage."
  type = object({
    priorityValue8021Action_SMB     = string
    priorityValue8021Action_Cluster = string
    bandwidthPercentage_SMB         = string
  })
  default = { "bandwidthPercentage_SMB" : "", "priorityValue8021Action_Cluster" : "", "priorityValue8021Action_SMB" : "" }
}

variable "storage_rdma_enabled" {
  description = "Indicates whether RDMA is enabled for storage. Storage RDMA will be enabled if either rdma_enabled or storage_rdma_enabled is set to true."
  type        = bool
  default     = false
}

variable "storage_tags" {
  description = "(Optional) Tags of the storage."
  type        = map(string)
  default     = null
}

variable "storage_traffic_type" {
  description = "Traffic type of storage."
  type        = list(string)
  default     = ["Storage"]
}

variable "subnet_mask" {
  description = "The subnet mask for the network."
  type        = string
  default     = "255.255.255.0"
}

variable "traffic_type" {
  description = "Traffic type of intent."
  type        = list(string)
  default     = ["Management", "Compute", "Storage"]
}

variable "witness_path" {
  description = "The path to the witness."
  type        = string
  default     = "Cloud"
}

variable "witness_storage_account_name" {
  description = "The name of the witness storage account."
  type        = string
  default     = ""
}

variable "witness_storage_account_resource_group_name" {
  description = "The resource group of the witness storage account. If not provided, 'resource_group_name' will be used as the storage account's resource group."
  type        = string
  default     = ""
}

variable "witness_storage_key_content_type" {
  description = "(Optional) Content type of the witness storage key."
  type        = string
  default     = null
}

variable "witness_storage_key_tags" {
  description = "(Optional) Tags of the witness storage key."
  type        = map(string)
  default     = null
}

variable "witness_type" {
  description = "The type of the witness."
  type        = string
  default     = "Cloud"
}
