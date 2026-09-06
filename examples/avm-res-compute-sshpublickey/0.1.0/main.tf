module "avm-res-compute-sshpublickey" {
  source              = "Azure/avm-res-compute-sshpublickey/azurerm"
  version             = "0.1.0"
  enable_telemetry    = var.enable_telemetry
  location            = var.location
  lock                = var.lock
  managed_identities  = var.managed_identities
  name                = var.name
  public_key          = var.public_key
  resource_group_name = var.resource_group_name
  role_assignments    = var.role_assignments
  tags                = var.tags
}
