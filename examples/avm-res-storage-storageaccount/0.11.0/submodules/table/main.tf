module "avm-res-storage-storageaccount" {
  source                                    = "Azure/avm-res-storage-storageaccount/azurerm"
  version                                   = "0.11.0"
  enable_telemetry                          = var.enable_telemetry
  location                                  = var.location
  name                                      = var.name
  resource_type                             = var.resource_type
  retry                                     = var.retry
  role_assignment_definition_lookup_enabled = var.role_assignment_definition_lookup_enabled
  role_assignments                          = var.role_assignments
  signed_identifiers                        = var.signed_identifiers
  storage_account_id                        = var.storage_account_id
  timeouts                                  = var.timeouts
}
