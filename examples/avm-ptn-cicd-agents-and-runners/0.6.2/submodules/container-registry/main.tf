module "avm-ptn-cicd-agents-and-runners" {
  source                                  = "Azure/avm-ptn-cicd-agents-and-runners/azurerm"
  version                                 = "0.6.2"
  container_compute_identity_principal_id = var.container_compute_identity_principal_id
  enable_telemetry                        = var.enable_telemetry
  images                                  = var.images
  location                                = var.location
  name                                    = var.name
  parent_id                               = var.parent_id
  private_dns_zone_id                     = var.private_dns_zone_id
  retry                                   = var.retry
  subnet_id                               = var.subnet_id
  tags                                    = var.tags
  timeouts                                = var.timeouts
  use_private_networking                  = var.use_private_networking
  use_zone_redundancy                     = var.use_zone_redundancy
}
