module "avm-res-compute-gallery" {
  source                   = "Azure/avm-res-compute-gallery/azurerm"
  version                  = "0.2.0"
  description              = var.description
  enable_telemetry         = var.enable_telemetry
  location                 = var.location
  lock                     = var.lock
  name                     = var.name
  resource_group_name      = var.resource_group_name
  role_assignments         = var.role_assignments
  shared_image_definitions = var.shared_image_definitions
  sharing                  = var.sharing
  tags                     = var.tags
  timeouts                 = var.timeouts
}
