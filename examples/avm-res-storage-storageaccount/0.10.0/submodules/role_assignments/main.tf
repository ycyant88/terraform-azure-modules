module "avm-res-storage-storageaccount" {
  source                                    = "Azure/avm-res-storage-storageaccount/azurerm"
  version                                   = "0.10.0"
  retry                                     = var.retry
  role_assignment_definition_lookup_enabled = var.role_assignment_definition_lookup_enabled
  role_assignments                          = var.role_assignments
  scope                                     = var.scope
  timeouts                                  = var.timeouts
  tracing_tags_header                       = var.tracing_tags_header
}
