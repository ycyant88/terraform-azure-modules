module "avm-res-cognitiveservices-account" {
  source                     = "Azure/avm-res-cognitiveservices-account/azurerm"
  version                    = "0.12.0"
  dynamic_throttling_enabled = var.dynamic_throttling_enabled
  enable_telemetry           = var.enable_telemetry
  location                   = var.location
  lock_id                    = var.lock_id
  model                      = var.model
  name                       = var.name
  parent_id                  = var.parent_id
  rai_policy_name            = var.rai_policy_name
  retry                      = var.retry
  scale                      = var.scale
  tags                       = var.tags
  timeouts                   = var.timeouts
  version_upgrade_option     = var.version_upgrade_option
}
