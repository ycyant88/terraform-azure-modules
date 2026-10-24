module "avm-res-app-managedenvironment" {
  source                           = "Azure/avm-res-app-managedenvironment/azurerm"
  version                          = "0.6.0"
  certificate_key_vault_properties = var.certificate_key_vault_properties
  enable_telemetry                 = var.enable_telemetry
  ignore_body_changes              = var.ignore_body_changes
  location                         = var.location
  name                             = var.name
  parent_id                        = var.parent_id
  password                         = var.password
  password_version                 = var.password_version
  resource_types                   = var.resource_types
  retry                            = var.retry
  tags                             = var.tags
  timeouts                         = var.timeouts
  value                            = var.value
  value_version                    = var.value_version
}
