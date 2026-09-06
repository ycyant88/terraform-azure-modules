module "avm-res-web-site" {
  source                  = "Azure/avm-res-web-site/azurerm"
  version                 = "0.21.2"
  application_logs        = var.application_logs
  detailed_error_messages = var.detailed_error_messages
  failed_requests_tracing = var.failed_requests_tracing
  http_logs               = var.http_logs
  parent_id               = var.parent_id
}
