variable "admin_password" {
  description = "Admin password"
  type        = string
  default     = ""
}

variable "admin_username" {
  description = "Admin username"
  type        = string
  default     = ""
}

variable "auto_upgrade_minor_version" {
  description = "Whether to enable auto upgrade minor version"
  type        = bool
  default     = true
}

variable "custom_location_id" {
  description = "The custom location ID for the Azure Stack HCI cluster."
  type        = string
  default     = ""
}

variable "data_disk_params" {
  description = "The array description of the dataDisks to attach to the vm. Provide an empty array for no additional disks, or an array following the example below."
  type = map(object({
    name       = string
    diskSizeGB = number
    dynamic    = bool
  }))
  default = {}
}

variable "domain_join_extension_tags" {
  description = "(Optional) Tags of the domain join extension."
  type        = map(string)
  default     = null
}

variable "domain_join_password" {
  description = "Optional Password of User with permissions to join the domain. - Required if 'domain_to_join' is specified."
  type        = string
  default     = null
}

variable "domain_join_user_name" {
  description = "Optional User Name with permissions to join the domain. example: domain-joiner - Required if 'domain_to_join' is specified."
  type        = string
  default     = ""
}

variable "domain_target_ou" {
  description = "Optional domain organizational unit to join. example: ou=computers,dc=contoso,dc=com - Required if 'domain_to_join' is specified."
  type        = string
  default     = ""
}

variable "domain_to_join" {
  description = "Optional Domain name to join - specify to join the VM to domain. example: contoso.com - If left empty, ou, username and password parameters will not be evaluated in the deployment."
  type        = string
  default     = ""
}

variable "dynamic_memory" {
  description = "Enable dynamic memory"
  type        = bool
  default     = true
}

variable "dynamic_memory_buffer" {
  description = "Buffer memory in MB when dynamic memory is enabled"
  type        = number
  default     = 20
}

variable "dynamic_memory_max" {
  description = "Maximum memory in MB when dynamic memory is enabled"
  type        = number
  default     = 8192
}

variable "dynamic_memory_min" {
  description = "Minimum memory in MB when dynamic memory is enabled"
  type        = number
  default     = 512
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "http_proxy" {
  description = "HTTP URL for proxy server. An example URL is:http://proxy.example.com:3128."
  type        = string
  default     = null
}

variable "https_proxy" {
  description = "HTTPS URL for proxy server. The server may still use an HTTP address as shown in this example: http://proxy.example.com:3128."
  type        = string
  default     = null
}

variable "image_id" {
  description = "The name of a Marketplace Gallery Image already downloaded to the Azure Stack HCI cluster. For example: winServer2022-01"
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

variable "logical_network_id" {
  description = "The ID of the logical network to use for the NIC."
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

variable "memory_mb" {
  description = "Memory in MB"
  type        = number
  default     = 8192
}

variable "name" {
  description = "Name of the VM resource"
  type        = string
  default     = ""
}

variable "nic_tags" {
  description = "(Optional) Tags of the nic."
  type        = map(string)
  default     = null
}

variable "no_proxy" {
  description = "URLs, which can bypass proxy. Typical examples would be [localhost,127.0.0.1,.svc,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,100.0.0.0/8]"
  type        = list(string)
  default     = []
}

variable "private_ip_address" {
  description = "The private IP address of the NIC"
  type        = string
  default     = ""
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

variable "tags" {
  description = "(Optional) Tags of the arc vm."
  type        = map(string)
  default     = null
}

variable "trusted_ca" {
  description = "Alternative CA cert to use for connecting to proxy servers."
  type        = string
  default     = null
}

variable "type_handler_version" {
  description = "The version of the type handler to use"
  type        = string
  default     = "1.3"
}

variable "user_storage_id" {
  description = "The user storage ID to store images."
  type        = string
  default     = ""
}

variable "v_cpu_count" {
  description = "Number of vCPUs"
  type        = number
  default     = 2
}
