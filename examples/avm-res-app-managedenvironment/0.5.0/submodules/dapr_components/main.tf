module "avm-res-app-managedenvironment" {
  source                  = "Azure/avm-res-app-managedenvironment/azurerm"
  version                 = "0.5.0"
  component_type          = var.component_type
  dapr_components_version = var.dapr_components_version
  enable_telemetry        = var.enable_telemetry
  ignore_errors           = var.ignore_errors
  init_timeout            = var.init_timeout
  metadata                = var.metadata
  name                    = var.name
  parent_id               = var.parent_id
  scopes                  = var.scopes
  secret_store_component  = var.secret_store_component
  secrets                 = var.secrets
  secrets_version         = var.secrets_version
  service_component_bind  = var.service_component_bind
}
