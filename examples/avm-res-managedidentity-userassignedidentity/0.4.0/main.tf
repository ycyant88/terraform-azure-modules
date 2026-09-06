module "avm-res-managedidentity-userassignedidentity" {
  source                         = "Azure/avm-res-managedidentity-userassignedidentity/azurerm"
  version                        = "0.4.0"
  enable_telemetry               = var.enable_telemetry
  federated_identity_credentials = var.federated_identity_credentials
  location                       = var.location
  lock                           = var.lock
  name                           = var.name
  resource_group_name            = var.resource_group_name
  role_assignments               = var.role_assignments
  tags                           = var.tags
}
