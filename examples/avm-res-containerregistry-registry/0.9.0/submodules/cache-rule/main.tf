module "avm-res-containerregistry-registry" {
  source                     = "Azure/avm-res-containerregistry-registry/azurerm"
  version                    = "0.9.0"
  credential_set_resource_id = var.credential_set_resource_id
  enable_telemetry           = var.enable_telemetry
  location                   = var.location
  name                       = var.name
  parent_id                  = var.parent_id
  resource_types             = var.resource_types
  retry                      = var.retry
  source_repository          = var.source_repository
  target_repository          = var.target_repository
  timeouts                   = var.timeouts
}
