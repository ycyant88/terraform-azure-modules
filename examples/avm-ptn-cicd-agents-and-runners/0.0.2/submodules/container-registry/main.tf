module "avm-ptn-cicd-agents-and-runners" {
  source                                  = "Azure/avm-ptn-cicd-agents-and-runners/azurerm"
  version                                 = "0.0.2"
  container_compute_identity_principal_id = var.container_compute_identity_principal_id
  enable_telemetry                        = var.enable_telemetry
  images                                  = var.images
  location                                = var.location
  name                                    = var.name
  private_dns_zone_id                     = var.private_dns_zone_id
  resource_group_name                     = var.resource_group_name
  subnet_id                               = var.subnet_id
  tags                                    = var.tags
  use_private_networking                  = var.use_private_networking
}
