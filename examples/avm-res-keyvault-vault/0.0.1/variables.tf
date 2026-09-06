variable "contacts" {
  description = "A map of contacts for the Key Vault. The map key is deliberately arbitrary to avoid issues where may keys maybe unknown at plan time."
  type = map(object({
    email = string
    name  = optional(string, null)
    phone = optional(string, null)
  }))
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetry.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "enabled_for_deployment" {
  description = "Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the vault."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Specifies whether Azure Resource Manager is permitted to retrieve secrets from the vault."
  type        = bool
  default     = false
}

variable "keys" {
  description = "A map of keys to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where may keys maybe unknown at plan time.\n\n- name - The name of the key.\n- key_type - The type of the key. Possible values are EC and RSA.\n- key_opts - A list of key options. Possible values are decrypt, encrypt, sign, unwrapKey, verify, and wrapKey.\n- key_size - The size of the key. Required for RSA keys.\n- curve - The curve of the key. Required for EC keys.  Possible values are P-256, P-256K, P-384, and P-521. The API will default to P-256 if nothing is specified.\n- not_before_date - The not before date of the key.\n- expiration_date - The expiration date of the key.\n- tags - A mapping of tags to assign to the key.\n- rotation_policy - The rotation policy of the key.\n  - automatic - The automatic rotation policy of the key.\n    - time_after_creation - The time after creation of the key before it is automatically rotated.\n    - time_before_expiry - The time before expiry of the key before it is automatically rotated.\n  - expire_after - The time after which the key expires.\n  - notify_before_expiry - The time before expiry of the key when notification emails will be sent.\n\nSupply role assignments in the same way as for var.role_assignments.\n"
  type = map(object({
    name     = string
    key_type = string
    key_opts = optional(list(string), ["sign", "verify"])

    key_size        = optional(number, null)
    curve           = optional(string, null)
    not_before_date = optional(string, null)
    expiration_date = optional(string, null)
    tags            = optional(map(any), null)

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})

    rotation_policy = optional(object({
      automatic = optional(object({
        time_after_creation = optional(string, null)
        time_before_expiry  = optional(string, null)
      }), null)
      expire_after         = optional(string, null)
      notify_before_expiry = optional(string, null)
    }), null)
  }))
  default = {}
}

variable "location" {
  description = "The Azure location where the resources will be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock level to apply to the Key Vault. Possible values are None, CanNotDelete, and ReadOnly."
  type = object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
  default = {}
}

variable "name" {
  description = "The name of the Key Vault."
  type        = string
  default     = ""
}

variable "network_acls" {
  description = ""
  type = object({
    bypass                     = optional(string, "None")
    default_action             = optional(string, "Deny")
    ip_rules                   = optional(list(string), [])
    virtual_network_subnet_ids = optional(list(string), [])
  })
  default = null
}

variable "private_endpoints" {
  description = ""
  type = map(object({
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})
    lock = object({
      name = optional(string, null)
      kind = optional(string, "None")
    })
    tags                                    = optional(map(any), null)
    service                                 = string
    subnet_resource_id                      = string
    private_dns_zone_group_name             = optional(string, null)
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_resource_ids = optional(set(string), [])
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      subresource_name   = optional(string, "vault")
      member_name        = optional(string, "vault")
      private_ip_address = string
    })), {})
  }))
  default = {}
}

variable "purge_protection_enabled" {
  description = "Specifies whether protection against purge is enabled for this Key Vault. Note once enabled this cannot be disabled."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where may keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
  }))
  default = {}
}

variable "secrets" {
  description = "A map of secrets to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where may keys maybe unknown at plan time.\n\n- name - The name of the secret.\n- content_type - The content type of the secret.\n- tags - A mapping of tags to assign to the secret.\n- not_before_date - The not before date of the secret.\n- expiration_date - The expiration date of the secret.\n\nSupply role assignments in the same way as for var.role_assignments.\n\n> Note: the value of the secret is supplied via the var.secrets_value variable. Make sure to use the same map key.\n"
  type = map(object({
    name            = string
    content_type    = optional(string, null)
    tags            = optional(map(any), null)
    not_before_date = optional(string, null)
    expiration_date = optional(string, null)

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})
  }))
  default = {}
}

variable "secrets_value" {
  description = "A map of secret keys to values.\nThe map key is the supplied input to var.secrets.\nThe map value is the secret value.\n\nThis is a separate variable to var.secrets because it is sensitive and therefore cannot be used in a for_each loop.\n"
  type        = map(string)
  default     = {}
}

variable "sku_name" {
  description = "The SKU name of the Key Vault. Possible values are standard and premium."
  type        = string
  default     = "standard"
}

variable "tags" {
  description = "Map of tags to assign to the Key Vault resource."
  type        = map(any)
  default     = null
}

variable "tenant_id" {
  description = "The Azure tenant ID used for authenticating requests to Key Vault. You can use the azurerm_client_config data source to retrieve it."
  type        = string
  default     = ""
}

variable "wait_for_rbac_before_key_operations" {
  description = "This variable controls the amount of time to wait before performing key operations.\nIt only applies when var.role_assignments and var.keys are both set.\nThis is useful when you are creating role assignments on the key vault and immediately creating keys in it.\nThe default is 30 seconds for create and 0 seconds for destroy.\n"
  type = object({
    create  = optional(string, "30s")
    destroy = optional(string, "0s")
  })
  default = {}
}

variable "wait_for_rbac_before_secret_operations" {
  description = "This variable controls the amount of time to wait before performing secret operations.\nIt only applies when var.role_assignments and var.secrets are both set.\nThis is useful when you are creating role assignments on the key vault and immediately creating secrets in it.\nThe default is 30 seconds for create and 0 seconds for destroy.\n"
  type = object({
    create  = optional(string, "30s")
    destroy = optional(string, "0s")
  })
  default = {}
}
