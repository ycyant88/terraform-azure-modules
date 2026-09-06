module "avm-res-compute-virtualmachine" {
  source                       = "Azure/avm-res-compute-virtualmachine/azurerm"
  version                      = "0.19.0"
  error_blob_managed_identity  = var.error_blob_managed_identity
  error_blob_uri               = var.error_blob_uri
  location                     = var.location
  name                         = var.name
  output_blob_managed_identity = var.output_blob_managed_identity
  output_blob_uri              = var.output_blob_uri
  parameters                   = var.parameters
  protected_parameters         = var.protected_parameters
  run_as_password              = var.run_as_password
  run_as_user                  = var.run_as_user
  script_source                = var.script_source
  tags                         = var.tags
  timeouts                     = var.timeouts
  virtualmachine_resource_id   = var.virtualmachine_resource_id
}
