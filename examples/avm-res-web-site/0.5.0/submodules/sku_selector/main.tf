module "avm-res-web-site" {
  source            = "Azure/avm-res-web-site/azurerm"
  version           = "0.5.0"
  deployment_region = var.deployment_region
}
