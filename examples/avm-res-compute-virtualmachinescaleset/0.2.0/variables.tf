variable "additional_capabilities" {
  description = "- ultra_ssd_enabled - (Optional) Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Orchestrated Virtual Machine Scale Set? Defaults to false. Changing this forces a new resource to be created.\n"
  type = object({
    ultra_ssd_enabled = optional(bool)
  })
  default = null
}

variable "admin_password" {
  description = "(Optional) Sets the VM password"
  type        = string
  default     = ""
}

variable "admin_ssh_keys" {
  description = "(Optional) SSH Keys to be used for Linx instances\n- Unique id.  Referenced in the os_profile below\n- (Required) The Public Key which should be used for authentication, which needs to be at least 2048-bit and in ssh-rsa format.\n- (Required) The Username for which this Public SSH Key should be configured.\n"
  type = set(object({
    id         = string
    public_key = string
    username   = string
  }))
  default = ""
}

variable "automatic_instance_repair" {
  description = "Description: Enabling automatic instance repair allows VMSS to automatically detect and recover unhealthy VM instances at runtime, ensuring high application availability\n\n> Note: To enable the automatic_instance_repair, the Orchestrated Virtual Machine Scale Set must have a valid health_probe_id or an [Application Health Extension](https://docs.microsoft.com/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-health-extension).  Defaulted to true as per this reliability recommendation: [Enable automatic repair policy](https://learn.microsoft.com/en-us/azure/reliability/reliability-virtual-machine-scale-sets?tabs=graph-4%2Cgraph-1%2Cgraph-2%2Cgraph-3%2Cgraph-5%2Cgraph-6%2Cportal#-enable-automatic-repair-policy)\n\n - enabled - (Required) Should the automatic instance repair be enabled on this Orchestrated Virtual Machine Scale Set? Possible values are true and false.\n - grace_period - (Optional) Amount of time for which automatic repairs will be delayed. The grace period starts right after the VM is found unhealthy. Possible values are between 30 and 90 minutes. The time duration should be specified in ISO 8601 format (e.g. PT30M to PT90M). Defaults to PT30M.\n"
  type = object({
    enabled      = bool
    grace_period = optional(string)
  })
  default = { "enabled" : true }
}

variable "boot_diagnostics" {
  description = "- storage_account_uri - (Optional) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. By including a boot_diagnostics block without passing the storage_account_uri field will cause the API to utilize a Managed Storage Account to store the Boot Diagnostics output.\n"
  type = object({
    storage_account_uri = optional(string)
  })
  default = null
}

variable "capacity_reservation_group_id" {
  description = "(Optional) Specifies the ID of the Capacity Reservation Group which the Virtual Machine Scale Set should be allocated to. Changing this forces a new resource to be created.\n\n> Note: capacity_reservation_group_id cannot be specified with proximity_placement_group_id.  If capacity_reservation_group_id is specified the single_placement_group must be set to false. \n"
  type        = string
  default     = null
}

variable "data_disk" {
  description = " - caching - (Required) The type of Caching which should be used for this Data Disk. Possible values are None, ReadOnly and ReadWrite.\n - create_option - (Optional) The create option which should be used for this Data Disk. Possible values are Empty and FromImage. Defaults to Empty. (FromImage should only be used if the source image includes data disks).\n - disk_encryption_set_id - (Optional) The ID of the Disk Encryption Set which should be used to encrypt the Data Disk. Changing this forces a new resource to be created.\n\n> Note: Disk Encryption Sets are in Public Preview in a limited set of regions. \n\n - disk_size_gb - (Required) The size of the Data Disk which should be created.\n - lun - (Required) The Logical Unit Number of the Data Disk, which must be unique within the Virtual Machine.\n - storage_account_type - (Required) The Type of Storage Account which should back this Data Disk. Possible values include Standard_LRS, StandardSSD_LRS, StandardSSD_ZRS, Premium_LRS, PremiumV2_LRS, Premium_ZRS and UltraSSD_LRS.\n - ultra_ssd_disk_iops_read_write - (Optional) Specifies the Read-Write IOPS for this Data Disk. Only settable when storage_account_type is PremiumV2_LRS or UltraSSD_LRS.\n - ultra_ssd_disk_mbps_read_write - (Optional) Specifies the bandwidth in MB per second for this Data Disk. Only settable when storage_account_type is PremiumV2_LRS or UltraSSD_LRS.\n - write_accelerator_enabled - (Optional) Specifies if Write Accelerator is enabled on the Data Disk. Defaults to false.\n"
  type = set(object({
    caching                        = string
    create_option                  = optional(string)
    disk_encryption_set_id         = optional(string)
    disk_size_gb                   = number
    lun                            = number
    storage_account_type           = string
    ultra_ssd_disk_iops_read_write = optional(number)
    ultra_ssd_disk_mbps_read_write = optional(number)
    write_accelerator_enabled      = optional(bool)
  }))
  default = null
}

variable "enable_telemetry" {
  description = "-> This is a Note\nThis variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "encryption_at_host_enabled" {
  description = "(Optional) Should disks attached to this Virtual Machine Scale Set be encrypted by enabling Encryption at Host?. "
  type        = bool
  default     = null
}

variable "eviction_policy" {
  description = "(Optional) The Policy which should be used Virtual Machines are Evicted from the Scale Set. Possible values are Deallocate and Delete. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "extension" {
  description = " - auto_upgrade_minor_version_enabled - (Optional) Should the latest version of the Extension be used at Deployment Time, if one is available? This won't auto-update the extension on existing installation. Defaults to true.\n - extensions_to_provision_after_vm_creation - (Optional) An set of Extension names which Orchestrated Virtual Machine Scale Set should provision after VM creation.\n - failure_suppression_enabled - (Optional) Should failures from the extension be suppressed? Possible values are true or false.\n\n> Note: Operational failures such as not connecting to the VM will not be suppressed regardless of the failure_suppression_enabled value.\n\n - force_extension_execution_on_change - (Optional) A value which, when different to the previous value can be used to force-run the Extension even if the Extension Configuration hasn't changed.\n - name - (Required) The name for the Virtual Machine Scale Set Extension.\n  \n > Note: Keys within the protected_settings block are notoriously case-sensitive, where the casing required (e.g. TitleCase vs snakeCase) depends on the Extension being used. Please refer to the documentation for the specific Orchestrated Virtual Machine Extension you're looking to use for more information.\n\n - publisher - (Required) Specifies the Publisher of the Extension.\n - settings - (Optional) A JSON String which specifies Settings for the Extension.\n - type - (Required) Specifies the Type of the Extension.\n - type_handler_version - (Required) Specifies the version of the extension to use, available versions can be found using the Azure CLI.\n\n ---\n protected_settings_from_key_vault block supports the following:\n - secret_url - (Required) The URL to the Key Vault Secret which stores the protected settings.\n - source_vault_id - (Required) The ID of the source Key Vault.\n\nA Health Extension is deployed by default as per [WAF guidelines](https://learn.microsoft.com/en-us/azure/reliability/reliability-virtual-machine-scale-sets?tabs=graph-4%2Cgraph-1%2Cgraph-2%2Cgraph-3%2Cgraph-5%2Cgraph-6%2Cportal#monitoring).\n\n> Note: protected_settings_from_key_vault cannot be used with protected_settings\n\n"
  type = set(object({
    auto_upgrade_minor_version_enabled        = optional(bool)
    extensions_to_provision_after_vm_creation = optional(set(string))
    failure_suppression_enabled               = optional(bool)
    force_extension_execution_on_change       = optional(string)
    name                                      = string
    publisher                                 = string
    settings                                  = optional(string)
    type                                      = string
    type_handler_version                      = string
    protected_settings_from_key_vault = optional(object({
      secret_url      = string
      source_vault_id = string
    }), null)
  }))
  default = ""
}

variable "extension_operations_enabled" {
  description = "> Note: extension_operations_enabled may only be set to false if there are no extensions defined in the extension field.\n(Optional) Should extension operations be allowed on the Virtual Machine Scale Set? Possible values are true or false. Defaults to true. Changing this forces a new Orchestrated Virtual Machine Scale Set to be created.\n"
  type        = bool
  default     = null
}

variable "extension_protected_setting" {
  description = "(Optional) A JSON String which specifies Sensitive Settings (such as Passwords) for the Extension."
  type        = map(string)
  default     = ""
}

variable "extensions_time_budget" {
  description = "(Optional) Specifies the time alloted for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to PT1H30M."
  type        = string
  default     = null
}

variable "identity" {
  description = "- identity_ids - (Required) Specifies a set of User Managed Identity IDs to be assigned to this Orchestrated Windows Virtual Machine Scale Set.\n- type - (Required) The type of Managed Identity that should be configured on this Orchestrated Windows Virtual Machine Scale Set. Only possible value is UserAssigned.\n"
  type = object({
    identity_ids = set(string)
    type         = string
  })
  default = null
}

variable "instances" {
  description = "(Optional) The number of Virtual Machines in the Orcestrated Virtual Machine Scale Set."
  type        = number
  default     = null
}

variable "license_type" {
  description = "(Optional) Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) which should be used for this Orchestrated Virtual Machine Scale Set. Possible values are None, Windows_Client and Windows_Server."
  type        = string
  default     = null
}

variable "location" {
  description = "(Required) The Azure location where the Orchestrated Virtual Machine Scale Set should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n  \n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "max_bid_price" {
  description = "(Optional) The maximum price you're willing to pay for each Orchestrated Virtual Machine in this Scale Set, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machines in the Scale Set will be evicted using the eviction_policy. Defaults to -1, which means that each Virtual Machine in the Orchestrated Scale Set should not be evicted for price reasons.  See this reference for more details: [Pricing](https://learn.microsoft.com/en-us/azure/virtual-machines/spot-vms#pricing)"
  type        = number
  default     = -1
}

variable "name" {
  description = "(Required) The name of the Orchestrated Virtual Machine Scale Set. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "network_interface" {
  description = " - dns_servers - (Optional) A set of IP Addresses of DNS Servers which should be assigned to the Network Interface.\n - enable_accelerated_networking - (Optional) Does this Network Interface support Accelerated Networking? Possible values are true and false. Defaults to false.\n - enable_ip_forwarding - (Optional) Does this Network Interface support IP Forwarding? Possible values are true and false. Defaults to false.\n - name - (Required) The Name which should be used for this Network Interface. Changing this forces a new resource to be created.\n - network_security_group_id - (Optional) The ID of a Network Security Group which should be assigned to this Network Interface.\n - primary - (Optional) Is this the Primary IP Configuration? Possible values are true and false. Defaults to false.\n\n ---\n ip_configuration block supports the following:\n - application_gateway_backend_address_pool_ids - (Optional) A set of Backend Address Pools IDs from a Application Gateway which this Orchestrated Virtual Machine Scale Set should be connected to.\n - application_security_group_ids - (Optional) A set of Application Security Group IDs which this Orchestrated Virtual Machine Scale Set should be connected to.\n - load_balancer_backend_address_pool_ids - (Optional) A set of Backend Address Pools IDs from a Load Balancer which this Orchestrated Virtual Machine Scale Set should be connected to.\n\n> Note: When using this field you'll also need to configure a Rule for the Load Balancer, and use a depends_on between this resource and the Load Balancer Rule.\n\n - name - (Required) The Name which should be used for this IP Configuration.\n - primary - (Optional) Is this the Primary IP Configuration for this Network Interface? Possible values are true and false. Defaults to false.\n\n > Note: One ip_configuration block must be marked as Primary for each Network Interface.\n\n - subnet_id - (Optional) The ID of the Subnet which this IP Configuration should be connected to.\n\n> Note: subnet_id is required if version is set to IPv4.\n\n - version - (Optional) The Internet Protocol Version which should be used for this IP Configuration. Possible values are IPv4 and IPv6. Defaults to IPv4.\n\n ---\n public_ip_address block supports the following:\n - domain_name_label - (Optional) The Prefix which should be used for the Domain Name Label for each Virtual Machine Instance. Azure concatenates the Domain Name Label and Virtual Machine Index to create a unique Domain Name Label for each Virtual Machine. Valid values must be between 1 and 26 characters long, start with a lower case letter, end with a lower case letter or number and contains only a-z, 0-9 and hyphens.\n - idle_timeout_in_minutes - (Optional) The Idle Timeout in Minutes for the Public IP Address. Possible values are in the range 4 to 32.\n - name - (Required) The Name of the Public IP Address Configuration.\n - public_ip_prefix_id - (Optional) The ID of the Public IP Address Prefix from where Public IP Addresses should be allocated. Changing this forces a new resource to be created.\n - sku_name - (Optional) Specifies what Public IP Address SKU the Public IP Address should be provisioned as. Possible vaules include Basic_Regional, Basic_Global, Standard_Regional or Standard_Global. For more information about Public IP Address SKU's and their capabilities, please see the [product documentation](https://docs.microsoft.com/azure/virtual-network/ip-services/public-ip-addresses#sku). Changing this forces a new resource to be created.\n - version - (Optional) The Internet Protocol Version which should be used for this public IP address. Possible values are IPv4 and IPv6. Defaults to IPv4. Changing this forces a new resource to be created.\n\n ---\n ip_tag block supports the following:\n - tag - (Required) The IP Tag associated with the Public IP, such as SQL or Storage. Changing this forces a new resource to be created.\n - type - (Required) The Type of IP Tag, such as FirstPartyUsage. Changing this forces a new resource to be created.\n"
  type = set(object({
    dns_servers                   = optional(set(string))
    enable_accelerated_networking = optional(bool)
    enable_ip_forwarding          = optional(bool)
    name                          = string
    network_security_group_id     = optional(string)
    primary                       = optional(bool)
    ip_configuration = set(object({
      application_gateway_backend_address_pool_ids = optional(set(string))
      application_security_group_ids               = optional(set(string))
      load_balancer_backend_address_pool_ids       = optional(set(string))
      name                                         = string
      primary                                      = optional(bool)
      subnet_id                                    = optional(string)
      version                                      = optional(string)
      public_ip_address = optional(set(object({
        domain_name_label       = optional(string)
        idle_timeout_in_minutes = optional(number)
        name                    = string
        public_ip_prefix_id     = optional(string)
        sku_name                = optional(string)
        version                 = optional(string)
        ip_tag = optional(set(object({
          tag  = string
          type = string
        })))
      })))
    }))
  }))
  default = null
}

variable "os_disk" {
  description = "- caching - (Required) The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite.\n- disk_encryption_set_id - (Optional) The ID of the Disk Encryption Set which should be used to encrypt this OS Disk. Changing this forces a new resource to be created.\n- disk_size_gb - (Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine Scale Set is sourced from.\n- storage_account_type - (Required) The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS, StandardSSD_ZRS, Premium_LRS and Premium_ZRS. Changing this forces a new resource to be created.\n- write_accelerator_enabled - (Optional) Specifies if Write Accelerator is enabled on the OS Disk. Defaults to false.\n\n---\ndiff_disk_settings block supports the following:\n- option - (Required) Specifies the Ephemeral Disk Settings for the OS Disk. At this time the only possible value is Local. Changing this forces a new resource to be created.\n- placement - (Optional) Specifies where to store the Ephemeral Disk. Possible values are CacheDisk and ResourceDisk. Defaults to CacheDisk. Changing this forces a new resource to be created.\n"
  type = object({
    caching                   = string
    disk_encryption_set_id    = optional(string)
    disk_size_gb              = optional(number)
    storage_account_type      = string
    write_accelerator_enabled = optional(bool)
    diff_disk_settings = optional(object({
      option    = string
      placement = optional(string)
    }))
  })
  default = { "caching" : "ReadWrite", "storage_account_type" : "Premium_LRS" }
}

variable "os_profile" {
  description = "Configure the operating system provile.\n\n - custom_data - (Optional) The Base64-Encoded Custom Data which should be used for this Orchestrated Virtual Machine Scale Set.\n\n > Note: When Custom Data has been configured, it's not possible to remove it without tainting the Orchestrated Virtual Machine Scale Set, due to a limitation of the Azure API.\n\n ---\n linux_configuration block supports the following:\n - admin_username - (Required) The username of the local administrator on each Orchestrated Virtual Machine Scale Set instance. Changing this forces a new resource to be created.\n - computer_name_prefix - (Optional) The prefix which should be used for the name of the Virtual Machines in this Scale Set. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name_prefix, then you must specify computer_name_prefix. Changing this forces a new resource to be created.\n - disable_password_authentication - (Optional) When an admin_password is specified disable_password_authentication must be set to false. Defaults to true.\n\n> Note: Either admin_password or admin_ssh_key must be specified.\n\n - patch_assessment_mode - (Optional) Specifies the mode of VM Guest Patching for the virtual machines that are associated to the Orchestrated Virtual Machine Scale Set. Possible values are AutomaticByPlatform or ImageDefault. Defaults to AutomaticByPlatform.\n\n> Note: If the patch_assessment_mode is set to AutomaticByPlatform then the provision_vm_agent field must be set to true.\n\n - patch_mode - (Optional) Specifies the mode of in-guest patching of this Windows Virtual Machine. Possible values are ImageDefault or AutomaticByPlatform. Defaults to AutomaticByPlatform. For more information on patch modes please see the [product documentation](https://docs.microsoft.com/azure/virtual-machines/automatic-vm-guest-patching#patch-orchestration-modes).\n\n> Note: If patch_mode is set to AutomaticByPlatform the provision_vm_agent must be set to true and the extension must contain at least one application health extension. \n\n - provision_vm_agent - (Optional) Should the Azure VM Agent be provisioned on each Virtual Machine in the Scale Set? Defaults to true. Changing this value forces a new resource to be created.\n\n ---\n admin_ssh_key_id Set of ids which reference the admin_ssh_keys sensitive variable\n \n > Note: The Azure VM Agent only allows creating SSH Keys at the path /home/{username}/.ssh/authorized_keys - as such this public key will be written to the authorized keys file.\n\n ---\n secret block supports the following:\n - key_vault_id - (Required) The ID of the Key Vault from which all Secrets should be sourced.\n\n ---\n certificate block supports the following:\n - url - (Required) The Secret URL of a Key Vault Certificate.\n\n > Note: The schema of the certificate block is slightly different depending on if you are provisioning a windows_configuration or a linux_configuration.\n\n---\n windows_configuration block supports the following:\n - admin_username - (Required) The username of the local administrator on each Orchestrated Virtual Machine Scale Set instance. Changing this forces a new resource to be created.\n - computer_name_prefix - (Optional) The prefix which should be used for the name of the Virtual Machines in this Scale Set. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name_prefix, then you must specify computer_name_prefix. Changing this forces a new resource to be created.\n - enable_automatic_updates - (Optional) Are automatic updates enabled for this Virtual Machine? Defaults to true.\n - hotpatching_enabled - (Optional) Should the VM be patched without requiring a reboot? Possible values are true or false. Defaults to false. For more information about hot patching please see the [product documentation](https://docs.microsoft.com/azure/automanage/automanage-hotpatch).\n\n> Note: Hotpatching can only be enabled if the patch_mode is set to AutomaticByPlatform, the provision_vm_agent is set to true, your source_image_reference references a hotpatching enabled image, the VM's sku_name is set to a [Azure generation 2](https://docs.microsoft.com/azure/virtual-machines/generation-2#generation-2-vm-sizes) VM SKU and the extension contains an application health extension. \n\n - patch_assessment_mode - (Optional) Specifies the mode of VM Guest Patching for the virtual machines that are associated to the Orchestrated Virtual Machine Scale Set. Possible values are AutomaticByPlatform or ImageDefault. Defaults to ImageDefault.\n\n> Note: If the patch_assessment_mode is set to AutomaticByPlatform then the provision_vm_agent field must be set to true.\n\n - patch_mode - (Optional) Specifies the mode of in-guest patching of this Windows Virtual Machine. Possible values are Manual, AutomaticByOS and AutomaticByPlatform. Defaults to AutomaticByOS. For more information on patch modes please see the [product documentation](https://docs.microsoft.com/azure/virtual-machines/automatic-vm-guest-patching#patch-orchestration-modes).\n\n> Note: If patch_mode is set to AutomaticByPlatform the provision_vm_agent must be set to true and the extension must contain at least one application health extension.\n\n - provision_vm_agent - (Optional) Should the Azure VM Agent be provisioned on each Virtual Machine in the Scale Set? Defaults to true. Changing this value forces a new resource to be created.\n - timezone - (Optional) Specifies the time zone of the virtual machine, the possible values are defined [here](https://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/).\n\n ---\n secret block supports the following:\n - key_vault_id - (Required) The ID of the Key Vault from which all Secrets should be sourced.\n\n ---\n certificate block supports the following:\n - store - (Required) The certificate store on the Virtual Machine where the certificate should be added.\n - url - (Required) The Secret URL of a Key Vault Certificate.\n\n ---\n winrm_listener block supports the following:\n - certificate_url - (Optional) The Secret URL of a Key Vault Certificate, which must be specified when protocol is set to Https. Changing this forces a new resource to be created.\n - protocol - (Required) Specifies the protocol of listener. Possible values are Http or Https. Changing this forces a new resource to be created.\n\n> Note: This can be sourced from the secret_id field within the azurerm_key_vault_certificate Resource.\n\n"
  type = object({
    custom_data = optional(string)
    linux_configuration = optional(object({
      admin_username                  = string
      computer_name_prefix            = optional(string)
      disable_password_authentication = optional(bool)
      patch_assessment_mode           = optional(string)
      patch_mode                      = optional(string, "AutomaticByPlatform")
      provision_vm_agent              = optional(bool, true)
      admin_ssh_key_id                = optional(set(string))
      secret = optional(set(object({
        key_vault_id = string
        certificate = set(object({
          url = string
        }))
      })))
    }))
    windows_configuration = optional(object({
      admin_username           = string
      computer_name_prefix     = optional(string)
      enable_automatic_updates = optional(bool, true)
      hotpatching_enabled      = optional(bool)
      patch_assessment_mode    = optional(string)
      patch_mode               = optional(string, "AutomaticByPlatform")
      provision_vm_agent       = optional(bool, true)
      timezone                 = optional(string)
      secret = optional(set(object({
        key_vault_id = string
        certificate = set(object({
          store = string
          url   = string
        }))
      })))
      winrm_listener = optional(set(object({
        certificate_url = optional(string)
        protocol        = string
      })))
    }))
  })
  default = null
}

variable "plan" {
  description = "- name - (Required) Specifies the name of the image from the marketplace. Changing this forces a new resource to be created.\n- product - (Required) Specifies the product of the image from the marketplace. Changing this forces a new resource to be created.\n- publisher - (Required) Specifies the publisher of the image. Changing this forces a new resource to be created.\n"
  type = object({
    name      = string
    product   = string
    publisher = string
  })
  default = null
}

variable "platform_fault_domain_count" {
  description = "(Required) Specifies the number of fault domains that are used by this Orchestrated Virtual Machine Scale Set. Changing this forces a new resource to be created."
  type        = number
  default     = ""
}

variable "priority" {
  description = "(Optional) The Priority of this Orchestrated Virtual Machine Scale Set. Possible values are Regular and Spot. Defaults to Regular. Changing this value forces a new resource."
  type        = string
  default     = "Regular"
}

variable "priority_mix" {
  description = "- base_regular_count - (Optional) Specifies the base number of VMs of Regular priority that will be created before any VMs of priority Spot are created. Possible values are integers between 0 and 1000. Defaults to 0.\n- regular_percentage_above_base - (Optional) Specifies the desired percentage of VM instances that are of Regular priority after the base count has been reached. Possible values are integers between 0 and 100. Defaults to 0.\n"
  type = object({
    base_regular_count            = optional(number)
    regular_percentage_above_base = optional(number)
  })
  default = null
}

variable "proximity_placement_group_id" {
  description = "(Optional) The ID of the Proximity Placement Group which the Orchestrated Virtual Machine should be assigned to. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group in which the Orchestrated Virtual Machine Scale Set should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "single_placement_group" {
  description = "(Optional) Should this Virtual Machine Scale Set be limited to a Single Placement Group, which means the number of instances will be capped at 100 Virtual Machines. Possible values are true or false.\n> Note: single_placement_group behaves differently for Orchestrated Virtual Machine Scale Sets than it does for other Virtual Machine Scale Sets. If you do not define the single_placement_group field in your configuration file the service will determin what this value should be based off of the value contained within the sku_name field of your configuration file. You may set the single_placement_group field to true, however once you set it to false you will not be able to revert it back to true. If you wish to use Specialty Sku virtual machines (e.g. [M-Seiries](https://docs.microsoft.com/azure/virtual-machines/m-series) virtual machines) you will need to contact you Microsoft support professional and request to be added to the include list since this feature is currently in private preview until the end of September 2022. Once you have been added to the private preview include list you will need to run the following command to register your subscription with the feature: az feature register --namespace Microsoft.Compute --name SpecialSkusForVmssFlex. If you are not on the include list this command will error out with the following error message (featureRegistrationUnsupported) The feature 'SpecialSkusForVmssFlex' does not support registration.\n"
  type        = bool
  default     = null
}

variable "sku_name" {
  description = "(Optional) The name of the SKU to be used by this Orcestrated Virtual Machine Scale Set. Valid values include: any of the [General purpose](https://docs.microsoft.com/azure/virtual-machines/sizes-general), [Compute optimized](https://docs.microsoft.com/azure/virtual-machines/sizes-compute), [Memory optimized](https://docs.microsoft.com/azure/virtual-machines/sizes-memory), [Storage optimized](https://docs.microsoft.com/azure/virtual-machines/sizes-storage), [GPU optimized](https://docs.microsoft.com/azure/virtual-machines/sizes-gpu), [FPGA optimized](https://docs.microsoft.com/azure/virtual-machines/sizes-field-programmable-gate-arrays), [High performance](https://docs.microsoft.com/azure/virtual-machines/sizes-hpc), or [Previous generation](https://docs.microsoft.com/azure/virtual-machines/sizes-previous-gen) virtual machine SKUs."
  type        = string
  default     = null
}

variable "source_image_id" {
  description = "(Optional) The ID of an Image which each Virtual Machine in this Scale Set should be based on. Possible Image ID types include Image IDs, Shared Image IDs, Shared Image Version IDs, Community Gallery Image IDs, Community Gallery Image Version IDs, Shared Gallery Image IDs and Shared Gallery Image Version IDs."
  type        = string
  default     = null
}

variable "source_image_reference" {
  description = "- offer - (Required) Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created.\n- publisher - (Required) Specifies the publisher of the image used to create the virtual machines. Changing this forces a new resource to be created.\n- sku - (Required) Specifies the SKU of the image used to create the virtual machines.\n- version - (Required) Specifies the version of the image used to create the virtual machines.\n"
  type = object({
    offer     = string
    publisher = string
    sku       = string
    version   = string
  })
  default = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "termination_notification" {
  description = "- enabled - (Required) Should the termination notification be enabled on this Virtual Machine Scale Set? Possible values true or false\n- timeout - (Optional) Length of time (in minutes, between 5 and 15) a notification to be sent to the VM on the instance metadata server till the VM gets deleted. The time duration should be specified in ISO 8601 format. Defaults to PT5M.\n"
  type = object({
    enabled = bool
    timeout = optional(string)
  })
  default = null
}

variable "timeouts" {
  description = "- create - (Defaults to 60 minutes) Used when creating the Orchestrated Virtual Machine Scale Set.\n- delete - (Defaults to 60 minutes) Used when deleting the Orchestrated Virtual Machine Scale Set.\n- read - (Defaults to 5 minutes) Used when retrieving the Orchestrated Virtual Machine Scale Set.\n- update - (Defaults to 60 minutes) Used when updating the Orchestrated Virtual Machine Scale Set.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "user_data_base64" {
  description = "(Optional) The Base64-Encoded User Data which should be used for this Virtual Machine Scale Set."
  type        = string
  default     = ""
}

variable "zone_balance" {
  description = "(Optional) Should the Virtual Machines in this Scale Set be strictly evenly distributed across Availability Zones? Defaults to false. Changing this forces a new resource to be created.\n\n> Note: This can only be set to true when one or more zones are configured.\n"
  type        = bool
  default     = null
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which this Orchestrated Virtual Machine should be located. Changing this forces a new Orchestrated Virtual Machine to be created.  Defaulted to 3 zones as per this reliability guidance: [Deploy Virtual Machine Scale Sets across availability zones with Virtual Machine Scale Sets Flex](https://learn.microsoft.com/en-us/azure/reliability/reliability-virtual-machine-scale-sets?tabs=graph-4%2Cgraph-1%2Cgraph-2%2Cgraph-3%2Cgraph-5%2Cgraph-6%2Cportal#-deploy-virtual-machine-scale-sets-across-availability-zones-with-virtual-machine-scale-sets-flex)\n\n> Note: Due to a limitation of the Azure API at this time only one Availability Zone can be defined.\n"
  type        = set(string)
  default     = ["1", "2", "3"]
}
