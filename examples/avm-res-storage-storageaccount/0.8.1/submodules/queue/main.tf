module "avm-res-storage-storageaccount" {
  source                                    = "Azure/avm-res-storage-storageaccount/azurerm"
  version                                   = "0.8.1"
  metadata                                  = var.metadata
  name                                      = var.name
  resource_type                             = var.resource_type
  retry                                     = var.retry
  role_assignment_definition_lookup_enabled = var.role_assignment_definition_lookup_enabled
  role_assignments                          = var.role_assignments
  storage_account_id                        = var.storage_account_id
  timeouts                                  = var.timeouts
  tracing_tags_header                       = var.tracing_tags_header
}
