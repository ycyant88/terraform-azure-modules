module "avm-res-web-site" {
  source                  = "Azure/avm-res-web-site/azurerm"
  version                 = "0.23.0"
  application_logs        = var.application_logs
  detailed_error_messages = var.detailed_error_messages
  failed_requests_tracing = var.failed_requests_tracing
  http_logs               = var.http_logs
  ignore_body_changes     = var.ignore_body_changes
  parent_id               = var.parent_id
  resource_types          = var.resource_types
  retry                   = var.retry
  timeouts                = var.timeouts
}
