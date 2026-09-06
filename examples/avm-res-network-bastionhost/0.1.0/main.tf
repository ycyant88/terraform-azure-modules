module "avm-res-network-bastionhost" {
  source               = "Azure/avm-res-network-bastionhost/azurerm"
  version              = "0.1.0"
  bastion_host         = var.bastion_host
  diagnostic_settings  = var.diagnostic_settings
  enable_telemetry     = var.enable_telemetry
  lock                 = var.lock
  resource_group_name  = var.resource_group_name
  role_assignments     = var.role_assignments
  subnet_name          = var.subnet_name
  tags                 = var.tags
  virtual_network_name = var.virtual_network_name
}
