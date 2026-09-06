variable "all_child_resources_inherit_lock" {
  description = "Whether all child resources should inherit the locks of the parent resource."
  type        = bool
  default     = true
}

variable "all_child_resources_inherit_tags" {
  description = "Whether all child resources should inherit the tags of the parent resource."
  type        = bool
  default     = true
}

variable "app_settings" {
  description = "  A map of app settings to assign to the static site. \n  \n  terraform\n  app_settings = {\n    WEBSITE_NODE_DEFAULT_VERSION = \"10.14.1\"\n    WEBSITE_TIME_ZONE            = \"Pacific Standard Time\"\n    WEB_CONCURRENCY              = \"1\"\n    WEBSITE_RUN_FROM_PACKAGE     = \"1\"\n    WEBSITE_ENABLE_SYNC_UPDATE_SITE = \"true\"\n    WEBSITE_ENABLE_SYNC_UPDATE_SITE_LOCKED = \"false\"\n    WEBSITE_NODE_DEFAULT_VERSION_LOCKED = \"false\"\n    WEBSITE_TIME_ZONE_LOCKED = \"false\"\n    WEB_CONCURRENCY_LOCKED = \"false\"\n    WEBSITE_RUN_FROM_PACKAGE_LOCKED = \"false\"\n  }\n  \n"
  type        = map(string)
  default     = {}
}

variable "branch" {
  description = "The branch of the repository to deploy."
  type        = string
  default     = null
}

variable "custom_domains" {
  description = "  A map of custom domains to assign to the static site. \n\n  - resource_group_name - (Optional) The name of the resource group where the custom domain is located. If not set, the resource group of the static site will be used.\n  - domain_name - (Optional) The domain name of the custom domain. If not set, the domain name will be generated from the cname_name and cname_zone_name.\n  - ttl - (Optional) The TTL of the custom domain. Defaults to 300.\n  - validation_type - (Optional) The type of validation to use for the custom domain. Possible values are cname-delegation and dns-txt-token. Defaults to cname-delegation.\n  - create_cname_records - (Optional) If set to true, CNAME records will be created for the custom domain. Defaults to false.\n  - create_txt_records - (Optional) If set to true, TXT records will be created for the custom domain. Defaults to false.\n  - cname_name - (Optional) The name of the CNAME record to create for the custom domain.\n  - cname_zone_name - (Optional) The name of the DNS zone to create the CNAME record in.\n  - cname_record - (Optional) The value of the CNAME record to create for the custom domain. Conflicts with cname_target_resource_id.\n  - cname_target_resource_id - (Optional) The resource ID of the resource the CNAME record should point to. Conflicts with cname_record.\n  - txt_name - (Optional) The name of the TXT record to create for the custom domain.\n  - txt_zone_name - (Optional) The name of the DNS zone to create the TXT record in.\n  - txt_records - (Optional) A map of TXT records to create for the custom domain. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n    - value - The value of the TXT record.\n\n  terraform\n  custom_domains = {\n    example = {\n      resource_group_name = \"example\"\n      domain_name         = \"example.com\"\n      ttl                 = 300\n      validation_type     = \"cname-delegation\"\n\n      cname_name               = \"www\"\n      cname_zone_name          = \"example.com\"\n      cname_record             = \"example.azurewebsites.net\"\n    }\n  }\n  \n"
  type = map(object({
    resource_group_name = optional(string)
    domain_name         = optional(string)
    ttl                 = optional(number, 300)
    validation_type     = optional(string, "cname-delegation")

    create_cname_records     = optional(bool, false)
    cname_name               = optional(string)
    cname_zone_name          = optional(string)
    cname_record             = optional(string)
    cname_target_resource_id = optional(string)

    create_txt_records = optional(bool, false)
    txt_name           = optional(string)
    txt_zone_name      = optional(string)
    txt_records        = optional(map(object({ value = string })))
  }))
  default = {}
}

variable "enable_telemetry" {
  description = "  This variable controls whether or not telemetry is enabled for the module.\n  For more information see https://aka.ms/avm/telemetryinfo.\n  If it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock level to apply. Default is None. Possible values are CanNotDelete and ReadOnly."
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n  \n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "private_endpoints" {
  description = "  A map of private endpoints to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the private endpoint. One will be generated if not set.\n  - role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n  - lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n  - tags - (Optional) A mapping of tags to assign to the private endpoint.\n  - subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n  - private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n  - private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n  - network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n  - location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n  - resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of this resource.\n  - ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n    - name - The name of the IP configuration.\n    - private_ip_address - The private IP address of the IP configuration.\n  - inherit_lock - (Optional) If set to true, the private endpoint will inherit the lock level of the parent resource. Defaults to true.\n  - inherit_tags - (Optional) If set to true, the private endpoint will inherit the tags of the parent resource. Defaults to true.\n\n  terraform\n"
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

variable "private_endpoints_inherit_lock" {
  description = "Whether private endpoints should inherit the lock of the parent resource."
  type        = bool
  default     = true
}

variable "private_endpoints_manage_dns_zone_group" {
  description = "Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy."
  type        = bool
  default     = true
}

variable "repository_url" {
  description = "The repository URL of the static site."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - The description of the role assignment.\n  - skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - The condition which will be used to scope the role assignment.\n  - condition_version - The version of the condition syntax. Valid values are '2.0'.\n  - delegated_managed_identity_resource_id - The resource ID of the delegated managed identity resource to assign the role to.\n\n  terraform\n\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "sku_size" {
  description = "The size of the SKU. The SKU size must be one of: Free, Standard."
  type        = string
  default     = "Free"
}

variable "sku_tier" {
  description = "The tier of the SKU. The SKU tier must be one of: Free, Standard."
  type        = string
  default     = "Free"
}

variable "tags" {
  description = "  A map of tags that will be applied to the Static Web App.\n"
  type        = map(string)
  default     = null
}
