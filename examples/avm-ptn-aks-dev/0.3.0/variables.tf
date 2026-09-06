variable "agents_tags" {
  description = "(Optional) A mapping of tags to assign to the Node Pool."
  type        = map(string)
  default     = null
}

variable "container_registry_name" {
  description = "(Optional) The name of the container registry to use for the AKS cluster."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "kubernetes_version" {
  description = "(Optional) Specify which Kubernetes release to use. Specify only minor version, such as '1.30'."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where the resources should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "(Optional) Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "The name for the AKS resources created in the specified Azure Resource Group. This variable overwrites the 'prefix' var (The 'prefix' var will still be applied to the dns_prefix if it is set)"
  type        = string
  default     = ""
}

variable "orchestrator_version" {
  description = "(Optional) Specify which Kubernetes release to use. Specify only minor version, such as '1.30'."
  type        = string
  default     = null
}

variable "rbac_aad_admin_group_object_ids" {
  description = "(Optional) Object ID of groups with admin access."
  type        = list(string)
  default     = null
}

variable "rbac_aad_azure_rbac_enabled" {
  description = "(Optional) Is Role Based Access Control based on Azure AD enabled?"
  type        = bool
  default     = null
}

variable "rbac_aad_tenant_id" {
  description = "(Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "user_assigned_identity_name" {
  description = "(Optional) The name of the User Assigned Managed Identity to create."
  type        = string
  default     = null
}

variable "user_assigned_managed_identity_resource_ids" {
  description = "(Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource."
  type        = set(string)
  default     = []
}

variable "vm_size" {
  description = "(Optional) The size of the Virtual Machines used by the default node pool. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard_D2s_v5"
}
