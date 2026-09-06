variable "agent_pool_profiles" {
  description = "The agent pool profiles"
  type = list(object({
    count             = number
    enableAutoScaling = optional(bool)
    nodeTaints        = optional(list(string))
    nodeLabels        = optional(map(string))
    maxPods           = optional(number)
    name              = optional(string)
    osSKU             = optional(string, "CBLMariner")
    osType            = optional(string, "Linux")
    vmSize            = optional(string, "Standard_A4_v2")
  }))
  default = ""
}

variable "azure_hybrid_benefit" {
  description = "The Azure Hybrid Benefit for the kubernetes cluster."
  type        = string
  default     = "False"
}

variable "control_plane_count" {
  description = "The count of the control plane"
  type        = number
  default     = 1
}

variable "control_plane_ip" {
  description = "The ip address of the control plane"
  type        = string
  default     = ""
}

variable "control_plane_vm_size" {
  description = "The size of the control plane VM"
  type        = string
  default     = "Standard_A4_v2"
}

variable "custom_location_id" {
  description = "The id of the Custom location that used to create hybrid aks"
  type        = string
  default     = ""
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

variable "enable_azure_rbac" {
  description = "Enable Azure RBAC for the kubernetes cluster"
  type        = bool
  default     = true
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "is_exported" {
  description = "Indicates whether the resource is exported"
  type        = bool
  default     = false
}

variable "kubernetes_version" {
  description = "The kubernetes version"
  type        = string
  default     = "1.28.5"
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

variable "logical_network_id" {
  description = "The id of the logical network that the AKS nodes will be connected to."
  type        = string
  default     = ""
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
  description = "The name of the hybrid aks"
  type        = string
  default     = ""
}

variable "nfs_csi_driver_enabled" {
  description = "Enable the NFS CSI driver for the kubernetes cluster."
  type        = bool
  default     = true
}

variable "pod_cidr" {
  description = "The CIDR range for the pods in the kubernetes cluster"
  type        = string
  default     = "10.244.0.0/16"
}

variable "rbac_admin_group_object_ids" {
  description = "The object id of the admin group of the azure rbac"
  type        = list(string)
  default     = []
}

variable "resource_group_id" {
  description = "The resource group id where the resources will be deployed."
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

variable "smb_csi_driver_enabled" {
  description = "Enable the SMB CSI driver for the kubernetes cluster."
  type        = bool
  default     = true
}

variable "ssh_key_vault_id" {
  description = "The id of the key vault that contains the SSH public and private keys."
  type        = string
  default     = null
}

variable "ssh_private_key_pem_secret_name" {
  description = "The name of the secret in the key vault that contains the SSH private key PEM."
  type        = string
  default     = "AksArcAgentSshPrivateKeyPem"
}

variable "ssh_public_key" {
  description = "The SSH public key that will be used to access the kubernetes cluster nodes. If not specified, a new SSH key pair will be generated."
  type        = string
  default     = null
}

variable "ssh_public_key_secret_name" {
  description = "The name of the secret in the key vault that contains the SSH public key."
  type        = string
  default     = "AksArcAgentSshPublicKey"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
