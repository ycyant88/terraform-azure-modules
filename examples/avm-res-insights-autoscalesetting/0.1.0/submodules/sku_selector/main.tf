module "avm-res-insights-autoscalesetting" {
  source            = "Azure/avm-res-insights-autoscalesetting/azurerm"
  version           = "0.1.0"
  deployment_region = var.deployment_region
}
