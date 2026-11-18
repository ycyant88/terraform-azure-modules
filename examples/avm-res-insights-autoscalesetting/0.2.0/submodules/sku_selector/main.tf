module "avm-res-insights-autoscalesetting" {
  source            = "Azure/avm-res-insights-autoscalesetting/azurerm"
  version           = "0.2.0"
  deployment_region = var.deployment_region
}
