module "avm-res-storage-storageaccount" {
  source                                    = "Azure/avm-res-storage-storageaccount/azurerm"
  version                                   = "0.7.3"
  access_tier                               = var.access_tier
  enabled_protocol                          = var.enabled_protocol
  metadata                                  = var.metadata
  name                                      = var.name
  quota                                     = var.quota
  resource_type                             = var.resource_type
  retry                                     = var.retry
  role_assignment_definition_lookup_enabled = var.role_assignment_definition_lookup_enabled
  role_assignments                          = var.role_assignments
  root_squash                               = var.root_squash
  signed_identifiers                        = var.signed_identifiers
  storage_account_id                        = var.storage_account_id
  timeouts                                  = var.timeouts
  tracing_tags_header                       = var.tracing_tags_header
}
