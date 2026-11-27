module "avm-res-web-site" {
  source                  = "Azure/avm-res-web-site/azurerm"
  version                 = "0.25.1"
  application_logs        = var.application_logs
  detailed_error_messages = var.detailed_error_messages
  enable_telemetry        = var.enable_telemetry
  failed_requests_tracing = var.failed_requests_tracing
  http_logs               = var.http_logs
  ignore_body_changes     = var.ignore_body_changes
  location                = var.location
  parent_id               = var.parent_id
  resource_types          = var.resource_types
  retry                   = var.retry
  timeouts                = var.timeouts
}
