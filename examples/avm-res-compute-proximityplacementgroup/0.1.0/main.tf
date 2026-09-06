module "avm-res-compute-proximityplacementgroup" {
  source              = "Azure/avm-res-compute-proximityplacementgroup/azurerm"
  version             = "0.1.0"
  allowed_vm_sizes    = var.allowed_vm_sizes
  enable_telemetry    = var.enable_telemetry
  location            = var.location
  lock                = var.lock
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
  zone                = var.zone
}
