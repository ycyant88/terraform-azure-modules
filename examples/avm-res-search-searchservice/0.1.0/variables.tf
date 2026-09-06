variable "allowed_ips" {
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the AI Search service"
  type        = list(string)
  default     = null
}

variable "authentication_failure_mode" {
  description = "(Optional) Specifies the response that the Search Service should return for requests that fail authentication. Possible values include http401WithBearerChallenge or http403."
  type        = string
  default     = null
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

variable "customer_managed_key_enforcement_enabled" {
  description = "(Optional) Specifies whether the Search Service should enforce that non-customer resources are encrypted. Defaults to false."
  type        = bool
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "hosting_mode" {
  description = "(Optional) Specifies the Hosting Mode, which allows for High Density partitions (that allow for up to 1000 indexes) should be supported. Possible values are highDensity or default. Defaults to default. Changing this forces a new Search Service to be created."
  type        = string
  default     = null
}

variable "local_authentication_enabled" {
  description = "(Optional) Specifies whether the Search Service allows authenticating using API Keys? Defaults to true."
  type        = bool
  default     = null
}

variable "location" {
  description = "(Required) Azure region where the resource should be deployed."
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

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "(Required) The name of the this resource."
  type        = string
  default     = ""
}

variable "partition_count" {
  description = "Partitions allow for scaling of document count as well as faster indexing by sharding your index over multiple search units."
  type        = number
  default     = 1
}

variable "public_network_access_enabled" {
  description = "This variable controls whether or not public network access is enabled for the module."
  type        = bool
  default     = true
}

variable "replica_count" {
  description = "Replicas distribute search workloads across the service. You need at least two replicas to support high availability of query workloads (not applicable to the free tier)."
  type        = number
  default     = 1
}

variable "resource_group_name" {
  description = "(Required) The resource group where the resources will be deployed."
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

variable "semantic_search_sku" {
  description = "(Optional) Specifies the Semantic Search SKU which should be used for this Search Service. Possible values include free and standard."
  type        = string
  default     = null
}

variable "sku" {
  description = "(Required) The pricing tier of the search service you want to create (for example, basic or standard)."
  type        = string
  default     = "standard"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
