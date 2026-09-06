module "avm-res-app-managedenvironment" {
  source            = "Azure/avm-res-app-managedenvironment/azurerm"
  version           = "0.5.0"
  bulk_subscribe    = var.bulk_subscribe
  dead_letter_topic = var.dead_letter_topic
  enable_telemetry  = var.enable_telemetry
  metadata          = var.metadata
  name              = var.name
  parent_id         = var.parent_id
  pubsub_name       = var.pubsub_name
  routes            = var.routes
  scopes            = var.scopes
  topic             = var.topic
}
