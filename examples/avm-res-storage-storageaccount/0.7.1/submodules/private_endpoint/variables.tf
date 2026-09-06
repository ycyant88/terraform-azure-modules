variable "application_security_group_resource_ids" {
  description = "(Optional) Application security groups to associate with the private endpoint. Defaults to {}. Map key is arbitrary; value is the ASG resource ID."
  type        = map(string)
  default     = {}
}

variable "dns_zone_group_resource_type" {
  description = "(Optional) Override the AzAPI <provider>/<resource>@<api-version> string used to manage the private DNS zone group attached to the private endpoint. Defaults to the value tested with this module version."
  type        = string
  default     = "Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2025-05-01"
}

variable "ip_configurations" {
  description = "(Optional) Static IP configurations for the private endpoint. Defaults to {} (the platform allocates IPs). The map key is arbitrary; each value supports:\n\n- name - (Required) The name of the IP configuration.\n- private_ip_address - (Required) The static private IP address to assign.\n"
  type = map(object({
    name               = string
    private_ip_address = string
  }))
  default = {}
}

variable "location" {
  description = "(Required) The Azure region of the private endpoint."
  type        = string
  default     = ""
}

variable "lock" {
  description = "(Optional) Management lock to apply to the private endpoint. Defaults to null (no lock).\n\n- kind - (Required) The kind of lock. Possible values are CanNotDelete and ReadOnly.\n- name - (Optional) The name of the lock. Defaults to null (auto-generated).\n"
  type = object({
    name = optional(string, null)
    kind = string
  })
  default = null
}

variable "lock_resource_type" {
  description = "(Optional) Override the AzAPI <provider>/<resource>@<api-version> string used to manage the management lock applied to the private endpoint. Defaults to the value tested with this module version."
  type        = string
  default     = "Microsoft.Authorization/locks@2020-05-01"
}

variable "manage_dns_zone_group" {
  description = "(Optional) Whether the private endpoint's DNS zone group should be managed by this module. Defaults to true."
  type        = bool
  default     = true
}

variable "name" {
  description = "(Required) The name of the private endpoint."
  type        = string
  default     = ""
}

variable "network_interface_name" {
  description = "(Optional) Custom name for the network interface created with the private endpoint. Defaults to null (auto-generated)."
  type        = string
  default     = null
}

variable "parent_id" {
  description = "(Required) The full resource ID of the resource group in which the private endpoint will be created."
  type        = string
  default     = ""
}

variable "private_connection_resource_id" {
  description = "(Required) The full resource ID of the resource that the private endpoint connects to (the storage account)."
  type        = string
  default     = ""
}

variable "private_dns_zone_group_name" {
  description = "(Optional) The name of the private DNS zone group. Defaults to default."
  type        = string
  default     = "default"
}

variable "private_dns_zone_resource_ids" {
  description = "(Optional) Private DNS zone resource IDs to associate with the private endpoint. Defaults to [] (no zones associated)."
  type        = set(string)
  default     = []
}

variable "private_service_connection_name" {
  description = "(Optional) The name of the private service connection. Defaults to null (auto-generated as pse-<endpoint name>)."
  type        = string
  default     = null
}

variable "resource_type" {
  description = "(Optional) Override the AzAPI <provider>/<resource>@<api-version> string used to manage the private endpoint. Defaults to the value tested with this module version."
  type        = string
  default     = "Microsoft.Network/privateEndpoints@2025-05-01"
}

variable "retry" {
  description = "(Optional) Retry configuration applied to AzAPI resources managed by this module. Defaults to null (no custom retry).\n\n- error_message_regex - (Optional) A list of regex patterns matching error messages that trigger a retry. Defaults to null.\n- interval_seconds - (Optional) Initial interval between retries in seconds. Defaults to null (provider default).\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds. Defaults to null (provider default).\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "role_assignment_definition_lookup_enabled" {
  description = "(Optional) Whether the role_assignments submodule should resolve role definition names supplied via role_definition_id_or_name by querying the Azure Authorization API. Defaults to true. See the role_assignments submodule for details."
  type        = bool
  default     = true
}

variable "role_assignments" {
  description = "(Optional) A map of role assignments to create at the private endpoint scope. Defaults to {}. See the role_assignments submodule for the attribute schema."
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

variable "subnet_resource_id" {
  description = "(Required) The subnet to deploy the private endpoint into."
  type        = string
  default     = ""
}

variable "subresource_name" {
  description = "(Required) The target subresource name (e.g. blob, dfs, file, queue, table, web)."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags to apply to the private endpoint. Defaults to null (no tags)."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "(Optional) Per-operation timeouts applied to AzAPI resources managed by this module. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n\n- create - (Optional) Timeout for create operations. Defaults to null.\n- read - (Optional) Timeout for read operations. Defaults to null.\n- update - (Optional) Timeout for update operations. Defaults to null.\n- delete - (Optional) Timeout for delete operations. Defaults to null.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "tracing_tags_header" {
  description = "(Optional) User-Agent string injected into AzAPI request headers. Defaults to null (no custom header)."
  type        = string
  default     = null
}
