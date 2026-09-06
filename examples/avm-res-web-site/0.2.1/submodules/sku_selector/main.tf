module "avm-res-web-site" {
  source            = "Azure/avm-res-web-site/azurerm"
  version           = "0.2.1"
  deployment_region = var.deployment_region
}
