module "avm-res-insights-autoscalesetting" {
  source              = "Azure/avm-res-insights-autoscalesetting/azurerm"
  version             = "0.1.2"
  enable_telemetry    = var.enable_telemetry
  enabled             = var.enabled
  location            = var.location
  name                = var.name
  notification        = var.notification
  predictive          = var.predictive
  profiles            = var.profiles
  resource_group_name = var.resource_group_name
  tags                = var.tags
  target_resource_id  = var.target_resource_id
}
