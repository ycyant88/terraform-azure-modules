module "avm-res-cognitiveservices-account" {
  source             = "Azure/avm-res-cognitiveservices-account/azurerm"
  version            = "0.11.1"
  base_policy_name   = var.base_policy_name
  content_filters    = var.content_filters
  custom_block_lists = var.custom_block_lists
  enable_telemetry   = var.enable_telemetry
  mode               = var.mode
  name               = var.name
  parent_id          = var.parent_id
  retry              = var.retry
  timeouts           = var.timeouts
}
