module "avm-res-insights-autoscalesetting" {
  source            = "Azure/avm-res-insights-autoscalesetting/azurerm"
  version           = "0.1.1"
  deployment_region = var.deployment_region
}
