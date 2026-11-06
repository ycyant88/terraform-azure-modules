module "avm-res-resources-resourcegroup" {
  source             = "Azure/avm-res-resources-resourcegroup/azurerm"
  version            = "0.5.0"
  enable_telemetry   = var.enable_telemetry
  ignore_tag_changes = var.ignore_tag_changes
  location           = var.location
  lock               = var.lock
  managed_by         = var.managed_by
  name               = var.name
  retry              = var.retry
  role_assignments   = var.role_assignments
  tags               = var.tags
  timeouts           = var.timeouts
}
