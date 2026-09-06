variable "description" {
  description = "(Optional) The description of the shared image gallery"
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "(Required) Azure region where the resource should be deployed.\n"
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

variable "name" {
  description = "(Required) Specifies the name of the Shared Image Gallery. Changing this forces a new resource to be created.\n"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - (Required) The ID or name of the role definition to assign to the principal.\n- principal_id - (Required) The ID of the principal to assign the role to.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check -(Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. If you are using a condition, valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. Changing this forces a new resource to be created. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "shared_image_definitions" {
  description = "A map to create on the Key shared image definitions\n- name - (Required) Specifies the name of the Shared Image. Changing this forces a new resource to be created.\n- identifier - (Required) An identifier object as defined below.\n  - publisher - (Required) The Publisher Name for this Gallery Image. Changing this forces a new resource to be created.\n  - offer - (Required) The Offer Name for this Shared Image. Changing this forces a new resource to be created.\n  - sku - (Required) The Name of the SKU for this Gallery Image. Changing this forces a new resource to be created.- os_type  - (Required) The type of Operating System present in this Shared Image. Possible values are Linux and Windows. Changing this forces a new resource to be created.        \n- os_type  - (Required) The type of Operating System present in this Shared Image. Possible values are Linux and Windows. Changing this forces a new resource to be created.        \n- purchase_plan - (Optional) A purchase_plan object as defined below.\n  - name - (Required) The Purchase Plan Name for this Shared Image. Changing this forces a new resource to be created.\n  - publisher - (Optional) The Purchase Plan Publisher for this Gallery Image. Changing this forces a new resource to be created.\n  - product - (Optional) The Purchase Plan Product for this Gallery Image. Changing this forces a new resource to be created.\n- description - (Optional) A description of this Shared Image.\n- disk_types_not_allowed - (Optional) One or more Disk Types not allowed for the Image. Possible values include Standard_LRS and Premium_LRS.\n- end_of_life_date - (Optional) The end of life date in RFC3339 format of the Image.\n- eula - (Optional) The End User Licence Agreement for the Shared Image. Changing this forces a new resource to be created.\n- specialized - (Optional) Specifies that the Operating System used inside this Image has not been Generalized (for example, sysprep on Windows has not been run). Changing this forces a new resource to be created.\n> Note: It's recommended to Generalize images where possible - Specialized Images reuse the same UUID internally within each Virtual Machine, which can have unintended side-effects.\n- architecture - (Optional) CPU architecture supported by an OS. Possible values are x64 and Arm64. Defaults to x64. Changing this forces a new resource to be created.\n- hyper_v_generation - (Optional) The generation of HyperV that the Virtual Machine used to create the Shared Image is based on. Possible values are V1 and V2. Defaults to V1. Changing this forces a new resource to be created.\n- max_recommended_vcpu_count - (Optional) Maximum count of vCPUs recommended for the Image.\n- min_recommended_vcpu_count - (Optional) Minimum count of vCPUs recommended for the Image.\n- max_recommended_memory_in_gb - (Optional) Maximum memory in GB recommended for the Image.\n- min_recommended_memory_in_gb - (Optional) Minimum memory in GB recommended for the Image.\n- privacy_statement_uri - (Optional) The URI containing the Privacy Statement associated with this Shared Image. Changing this forces a new resource to be created.\n- release_note_uri - (Optional) The URI containing the Release Notes associated with this Shared Image.\n- trusted_launch_supported - (Optional) Specifies if supports creation of both Trusted Launch virtual machines and Gen2 virtual machines with standard security created from the Shared Image. Changing this forces a new resource to be created.\n- trusted_launch_enabled - (Optional) Specifies if Trusted Launch has to be enabled for the Virtual Machine created from the Shared Image. Changing this forces a new resource to be created.\n- confidential_vm_supported - (Optional) Specifies if supports creation of both Confidential virtual machines and Gen2 virtual machines with standard security from a compatible Gen2 OS disk VHD or Gen2 Managed image. Changing this forces a new resource to be created.\n- confidential_vm_enabled - (Optional) Specifies if Confidential Virtual Machines enabled. It will enable all the features of trusted, with higher confidentiality features for isolate machines or encrypted data. Available for Gen2 machines. Changing this forces a new resource to be created.\n- accelerated_network_support_enabled - (Optional) Specifies if the Shared Image supports Accelerated Network. Changing this forces a new resource to be created.\n- tags - (Optional) A mapping of tags to assign to the Shared Image.\n> Note: Only one of trusted_launch_supported, trusted_launch_enabled, confidential_vm_supported and confidential_vm_enabled can be specified.\n"
  type = map(object({
    name = string
    identifier = object({
      publisher = string
      offer     = string
      sku       = string
    })
    os_type = string
    purchase_plan = optional(object({
      name      = string
      publisher = optional(string)
      product   = optional(string)
    }))
    description                         = optional(string)
    disk_types_not_allowed              = optional(list(string))
    end_of_life_date                    = optional(string)
    eula                                = optional(string)
    specialized                         = optional(bool)
    architecture                        = optional(string, "x64")
    hyper_v_generation                  = optional(string, "V1")
    max_recommended_vcpu_count          = optional(number)
    min_recommended_vcpu_count          = optional(number)
    max_recommended_memory_in_gb        = optional(number)
    min_recommended_memory_in_gb        = optional(number)
    privacy_statement_uri               = optional(string)
    release_note_uri                    = optional(string)
    trusted_launch_enabled              = optional(bool)
    confidential_vm_supported           = optional(bool)
    confidential_vm_enabled             = optional(bool)
    accelerated_network_support_enabled = optional(bool)
    tags                                = optional(map(string))
  }))
  default = {}
}

variable "sharing" {
  description = "A sharing object that supports the following:\n- permission - (Required) The permission of the Shared Image Gallery when sharing. Possible values are Community, Groups and Private. Changing this forces a new resource to be created.\n> Note: This requires that the Preview Feature Microsoft.Compute/CommunityGalleries is enabled, see the documentation for more information.\n- community_gallery - (Optional) A community_gallery object that supports the following:\n  - eula - (Required) The End User Licence Agreement for the Shared Image Gallery. Changing this forces a new resource to be created.\n  - prefix - (Required) Prefix of the community public name for the Shared Image Gallery. Changing this forces a new resource to be created.\n  - publisher_email - (Required) Email of the publisher for the Shared Image Gallery. Changing this forces a new resource to be created.       \n  - publisher_uri - (Required) URI of the publisher for the Shared Image Gallery. Changing this forces a new resource to be created.\n> Note: community_gallery must be set when permission is set to Community.\n"
  type = object({
    permission = string
    community_gallery = optional(object({
      eula            = string
      prefix          = string
      publisher_email = string
      publisher_uri   = string
    }))
  })
  default = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = " - create - (Defaults to 60 minutes) Used when creating the Shared Image Gallery.\n - delete - (Defaults to 60 minutes) Used when deleting the Shared Image Gallery.\n - read - (Defaults to 5 minutes) Used when retrieving the Shared Image Gallery.\n - update - (Defaults to 60 minutes) Used when updating the Shared Image Gallery.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
